; DESCRIPTION: Composite: Sets a single black pixel at (15, 214) then Creates a white rectangular region at (298, 123) spanning 54 by 54 pixels then Draws a yellow line from (108, 95) to (140, 224).
; PLAN: r0=15(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=123(y), r7=54(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x1), r11=95(y1), r12=140(x2), r13=224(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 123
LDI r7, 54
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 95
LDI r12, 140
LDI r13, 224
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
