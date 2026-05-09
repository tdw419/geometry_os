; DESCRIPTION: Renders a black box of size 94x94 starting at (17, 161).
; PLAN: r0=17(x), r1=161(y), r2=94(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 161
LDI r2, 94
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
