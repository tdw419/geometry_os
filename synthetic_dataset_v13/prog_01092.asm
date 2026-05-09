; DESCRIPTION: Composite: Sets a single green pixel at (498, 33) then Creates a yellow rectangular region at (96, 18) spanning 34 by 44 pixels then Draws a white line from (373, 108) to (446, 255).
; PLAN: r0=498(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=18(y), r7=34(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=108(y1), r12=446(x2), r13=255(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 33
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 18
LDI r7, 34
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 108
LDI r12, 446
LDI r13, 255
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
