; DESCRIPTION: Composite: Sets a single black pixel at (288, 174) then Places a green line segment connecting (395, 154) to (205, 95) then Renders a white box of size 37x114 starting at (28, 41).
; PLAN: r0=288(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=154(y1), r7=205(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=28(x), r11=41(y), r12=37(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 154
LDI r7, 205
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 41
LDI r12, 37
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
