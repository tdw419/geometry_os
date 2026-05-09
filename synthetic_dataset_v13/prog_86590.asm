; DESCRIPTION: Renders a black box of size 115x59 starting at (50, 58).
; PLAN: r0=50(x), r1=58(y), r2=115(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 58
LDI r2, 115
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
