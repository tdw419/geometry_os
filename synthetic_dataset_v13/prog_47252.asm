; DESCRIPTION: Renders a black box of size 94x109 starting at (10, 17).
; PLAN: r0=10(x), r1=17(y), r2=94(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 17
LDI r2, 94
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
