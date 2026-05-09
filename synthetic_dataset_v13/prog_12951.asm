; DESCRIPTION: Renders a yellow box of size 30x70 starting at (461, 110).
; PLAN: r0=461(x), r1=110(y), r2=30(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 110
LDI r2, 30
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
