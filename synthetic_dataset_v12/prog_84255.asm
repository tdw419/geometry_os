; DESCRIPTION: Creates a magenta rectangular region at (370, 60) spanning 87 by 28 pixels.
; PLAN: r0=370(x), r1=60(y), r2=87(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 60
LDI r2, 87
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
