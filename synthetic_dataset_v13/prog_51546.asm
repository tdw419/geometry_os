; DESCRIPTION: Renders a black box of size 34x111 starting at (298, 114).
; PLAN: r0=298(x), r1=114(y), r2=34(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 114
LDI r2, 34
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
