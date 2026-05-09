; DESCRIPTION: Composite: Creates a green rectangular region at (127, 145) spanning 26 by 82 pixels then Renders a cyan disk with center (131, 112) and radius 65 then Draws a red line from (400, 11) to (229, 125).
; PLAN: r0=127(x), r1=145(y), r2=26(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=112(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x1), r11=11(y1), r12=229(x2), r13=125(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 145
LDI r2, 26
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 112
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 11
LDI r12, 229
LDI r13, 125
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
