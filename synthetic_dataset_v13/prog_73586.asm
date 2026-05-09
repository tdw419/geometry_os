; DESCRIPTION: Renders a purple box of size 17x86 starting at (36, 9).
; PLAN: r0=36(x), r1=9(y), r2=17(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 9
LDI r2, 17
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
