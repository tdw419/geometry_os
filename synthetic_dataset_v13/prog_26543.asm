; DESCRIPTION: Renders a blue box of size 17x114 starting at (460, 19).
; PLAN: r0=460(x), r1=19(y), r2=17(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 19
LDI r2, 17
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
