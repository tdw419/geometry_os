; DESCRIPTION: Creates a purple rectangular region at (227, 180) spanning 89 by 48 pixels.
; PLAN: r0=227(x), r1=180(y), r2=89(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 180
LDI r2, 89
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
