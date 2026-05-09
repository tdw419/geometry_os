; DESCRIPTION: Creates a magenta rectangular region at (247, 160) spanning 87 by 21 pixels.
; PLAN: r0=247(x), r1=160(y), r2=87(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 160
LDI r2, 87
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
