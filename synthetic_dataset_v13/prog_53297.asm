; DESCRIPTION: Renders a green box of size 80x106 starting at (264, 53).
; PLAN: r0=264(x), r1=53(y), r2=80(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 53
LDI r2, 80
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
