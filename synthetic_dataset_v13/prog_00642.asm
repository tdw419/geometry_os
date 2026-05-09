; DESCRIPTION: Composite: Sets a single yellow pixel at (23, 152) then Draws a green rectangle at (37, 5) with width 92 and height 86 then Draws a red line from (253, 88) to (266, 141).
; PLAN: r0=23(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=5(y), r7=92(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x1), r11=88(y1), r12=266(x2), r13=141(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 37
LDI r6, 5
LDI r7, 92
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 88
LDI r12, 266
LDI r13, 141
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
