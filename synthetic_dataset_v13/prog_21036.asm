; DESCRIPTION: Composite: Creates a yellow circular shape at (153, 182) with radius 57 then Renders a green box of size 91x50 starting at (287, 14) then Places a yellow line segment connecting (112, 42) to (491, 51).
; PLAN: r0=153(x), r1=182(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=14(y), r7=91(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x1), r11=42(y1), r12=491(x2), r13=51(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 182
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 14
LDI r7, 91
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 42
LDI r12, 491
LDI r13, 51
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
