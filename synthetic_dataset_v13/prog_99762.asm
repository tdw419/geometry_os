; DESCRIPTION: Composite: Creates a white rectangular region at (84, 152) spanning 71 by 17 pixels then Sets a single cyan pixel at (83, 97) then Renders a green line between points (43, 135) and (259, 110).
; PLAN: r0=84(x), r1=152(y), r2=71(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=97(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=43(x1), r11=135(y1), r12=259(x2), r13=110(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 152
LDI r2, 71
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 97
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 135
LDI r12, 259
LDI r13, 110
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
