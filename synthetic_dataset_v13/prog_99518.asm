; DESCRIPTION: Renders a yellow box of size 110x70 starting at (308, 20).
; PLAN: r0=308(x), r1=20(y), r2=110(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 20
LDI r2, 110
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
