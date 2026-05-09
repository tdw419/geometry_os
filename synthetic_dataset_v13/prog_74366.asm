; DESCRIPTION: Creates a blue rectangular region at (89, 25) spanning 36 by 54 pixels.
; PLAN: r0=89(x), r1=25(y), r2=36(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 25
LDI r2, 36
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
