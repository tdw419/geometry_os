; DESCRIPTION: Renders a black box of size 65x54 starting at (114, 196).
; PLAN: r0=114(x), r1=196(y), r2=65(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 196
LDI r2, 65
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
