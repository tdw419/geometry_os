; DESCRIPTION: Renders a black box of size 80x35 starting at (360, 2).
; PLAN: r0=360(x), r1=2(y), r2=80(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 2
LDI r2, 80
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
