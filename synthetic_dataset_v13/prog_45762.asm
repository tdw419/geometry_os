; DESCRIPTION: Composite: Renders a magenta disk with center (260, 151) and radius 23 then Places a red line segment connecting (85, 160) to (43, 54) then Draws a cyan rectangle at (177, 11) with width 26 and height 27.
; PLAN: r0=260(x), r1=151(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=160(y1), r7=43(x2), r8=54(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=11(y), r12=26(width), r13=27(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 151
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 160
LDI r7, 43
LDI r8, 54
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 11
LDI r12, 26
LDI r13, 27
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
