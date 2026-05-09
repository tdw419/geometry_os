; DESCRIPTION: Renders a black box of size 104x24 starting at (208, 216).
; PLAN: r0=208(x), r1=216(y), r2=104(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 216
LDI r2, 104
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
