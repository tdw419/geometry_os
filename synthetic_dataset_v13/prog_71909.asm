; DESCRIPTION: Composite: Sets a single black pixel at (302, 172) then Places a yellow line segment connecting (357, 254) to (12, 30) then Renders a black box of size 43x34 starting at (443, 161).
; PLAN: r0=302(x), r1=172(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=357(x1), r6=254(y1), r7=12(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=161(y), r12=43(width), r13=34(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 172
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 357
LDI r6, 254
LDI r7, 12
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 161
LDI r12, 43
LDI r13, 34
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
