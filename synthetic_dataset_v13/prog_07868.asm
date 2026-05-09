; DESCRIPTION: Creates a blue rectangular region at (366, 50) spanning 46 by 89 pixels.
; PLAN: r0=366(x), r1=50(y), r2=46(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 50
LDI r2, 46
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
