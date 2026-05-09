; DESCRIPTION: Composite: Sets a single orange pixel at (89, 26) then Renders a orange box of size 59x109 starting at (0, 145) then Draws a red line from (271, 58) to (62, 154).
; PLAN: r0=89(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=145(y), r7=59(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x1), r11=58(y1), r12=62(x2), r13=154(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 0
LDI r6, 145
LDI r7, 59
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 58
LDI r12, 62
LDI r13, 154
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
