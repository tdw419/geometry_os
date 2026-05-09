; DESCRIPTION: Renders a black box of size 40x68 starting at (241, 162).
; PLAN: r0=241(x), r1=162(y), r2=40(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 162
LDI r2, 40
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
