; DESCRIPTION: Renders a yellow box of size 49x52 starting at (180, 104).
; PLAN: r0=180(x), r1=104(y), r2=49(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 104
LDI r2, 49
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
