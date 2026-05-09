; DESCRIPTION: Creates a magenta rectangular region at (307, 86) spanning 87 by 54 pixels.
; PLAN: r0=307(x), r1=86(y), r2=87(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 86
LDI r2, 87
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
