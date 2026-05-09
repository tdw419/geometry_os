; DESCRIPTION: Composite: Creates a cyan circular shape at (75, 150) with radius 43 then Creates a green rectangular region at (310, 152) spanning 18 by 34 pixels then Draws a red line from (11, 130) to (58, 183).
; PLAN: r0=75(x), r1=150(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=152(y), r7=18(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x1), r11=130(y1), r12=58(x2), r13=183(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 150
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 152
LDI r7, 18
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 130
LDI r12, 58
LDI r13, 183
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
