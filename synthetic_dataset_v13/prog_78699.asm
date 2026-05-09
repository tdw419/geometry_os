; DESCRIPTION: Renders a black box of size 48x109 starting at (170, 58).
; PLAN: r0=170(x), r1=58(y), r2=48(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 58
LDI r2, 48
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
