; DESCRIPTION: Renders a black box of size 96x22 starting at (385, 233).
; PLAN: r0=385(x), r1=233(y), r2=96(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 233
LDI r2, 96
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
