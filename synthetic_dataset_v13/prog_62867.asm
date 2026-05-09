; DESCRIPTION: Renders a yellow box of size 115x17 starting at (303, 153).
; PLAN: r0=303(x), r1=153(y), r2=115(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 153
LDI r2, 115
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
