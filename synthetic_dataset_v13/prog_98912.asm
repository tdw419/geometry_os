; DESCRIPTION: Composite: Places a green dot at position (287, 195) then Draws a red line from (92, 229) to (332, 75) then Creates a red rectangular region at (373, 86) spanning 63 by 104 pixels.
; PLAN: r0=287(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=229(y1), r7=332(x2), r8=75(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=86(y), r12=63(width), r13=104(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 229
LDI r7, 332
LDI r8, 75
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 86
LDI r12, 63
LDI r13, 104
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
