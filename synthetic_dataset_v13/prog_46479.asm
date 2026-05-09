; DESCRIPTION: Composite: Renders a green box of size 88x78 starting at (25, 8) then Places a black dot at position (139, 216) then Renders a cyan line between points (253, 164) and (353, 253).
; PLAN: r0=25(x), r1=8(y), r2=88(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=253(x1), r11=164(y1), r12=353(x2), r13=253(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 8
LDI r2, 88
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 253
LDI r11, 164
LDI r12, 353
LDI r13, 253
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
