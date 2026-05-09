; DESCRIPTION: Composite: Sets a single black pixel at (170, 27) then Renders a red box of size 34x85 starting at (174, 121) then Places a yellow line segment connecting (277, 148) to (154, 245).
; PLAN: r0=170(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=121(y), r7=34(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x1), r11=148(y1), r12=154(x2), r13=245(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 121
LDI r7, 34
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 148
LDI r12, 154
LDI r13, 245
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
