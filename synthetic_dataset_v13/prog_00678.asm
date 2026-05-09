; DESCRIPTION: Renders a black box of size 52x109 starting at (418, 74).
; PLAN: r0=418(x), r1=74(y), r2=52(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 74
LDI r2, 52
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
