; DESCRIPTION: Renders a yellow box of size 17x94 starting at (183, 103).
; PLAN: r0=183(x), r1=103(y), r2=17(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 103
LDI r2, 17
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
