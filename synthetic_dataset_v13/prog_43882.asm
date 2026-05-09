; DESCRIPTION: Composite: Renders a yellow line between points (264, 43) and (137, 159) then Renders a red box of size 104x109 starting at (0, 36).
; PLAN: r0=264(x1), r1=43(y1), r2=137(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=36(y), r7=104(width), r8=109(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 43
LDI r2, 137
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 36
LDI r7, 104
LDI r8, 109
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
