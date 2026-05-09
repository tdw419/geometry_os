; DESCRIPTION: Composite: Renders a orange line between points (320, 218) and (339, 151) then Sets a single red pixel at (24, 222) then Creates a green rectangular region at (404, 51) spanning 60 by 77 pixels.
; PLAN: r0=320(x1), r1=218(y1), r2=339(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=222(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=51(y), r12=60(width), r13=77(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 218
LDI r2, 339
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 222
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 404
LDI r11, 51
LDI r12, 60
LDI r13, 77
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
