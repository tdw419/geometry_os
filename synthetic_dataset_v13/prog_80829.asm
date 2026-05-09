; DESCRIPTION: Renders a yellow box of size 105x74 starting at (403, 110).
; PLAN: r0=403(x), r1=110(y), r2=105(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 110
LDI r2, 105
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
