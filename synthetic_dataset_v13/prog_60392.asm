; DESCRIPTION: Composite: Places a red line segment connecting (233, 239) to (423, 182) then Sets a single green pixel at (169, 215) then Draws a blue rectangle at (306, 63) with width 77 and height 105.
; PLAN: r0=233(x1), r1=239(y1), r2=423(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=215(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=63(y), r12=77(width), r13=105(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 239
LDI r2, 423
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 215
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 63
LDI r12, 77
LDI r13, 105
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
