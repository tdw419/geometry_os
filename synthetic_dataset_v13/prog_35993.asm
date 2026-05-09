; DESCRIPTION: Renders a black box of size 67x107 starting at (298, 106).
; PLAN: r0=298(x), r1=106(y), r2=67(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 106
LDI r2, 67
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
