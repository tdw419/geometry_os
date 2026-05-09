; DESCRIPTION: Composite: Renders a red box of size 30x102 starting at (156, 112) then Renders a white line between points (284, 240) and (148, 151) then Draws a orange circle centered at (378, 152) with radius 40.
; PLAN: r0=156(x), r1=112(y), r2=30(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=240(y1), r7=148(x2), r8=151(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=152(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 112
LDI r2, 30
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 240
LDI r7, 148
LDI r8, 151
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 152
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
