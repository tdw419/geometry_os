; DESCRIPTION: Renders a black box of size 119x25 starting at (278, 219).
; PLAN: r0=278(x), r1=219(y), r2=119(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 219
LDI r2, 119
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
