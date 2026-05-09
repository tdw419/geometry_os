; DESCRIPTION: Renders a black box of size 25x39 starting at (402, 197).
; PLAN: r0=402(x), r1=197(y), r2=25(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 197
LDI r2, 25
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
