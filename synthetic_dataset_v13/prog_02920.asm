; DESCRIPTION: Renders a black box of size 68x68 starting at (122, 178).
; PLAN: r0=122(x), r1=178(y), r2=68(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 178
LDI r2, 68
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
