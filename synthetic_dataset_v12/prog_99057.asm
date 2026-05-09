; DESCRIPTION: Creates a blue rectangular region at (99, 180) spanning 75 by 40 pixels.
; PLAN: r0=99(x), r1=180(y), r2=75(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 180
LDI r2, 75
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
