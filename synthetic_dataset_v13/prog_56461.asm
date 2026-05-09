; DESCRIPTION: Composite: Sets a single blue pixel at (48, 147) then Draws a orange rectangle at (376, 10) with width 45 and height 86 then Renders a red line between points (323, 135) and (161, 34).
; PLAN: r0=48(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=10(y), r7=45(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=323(x1), r11=135(y1), r12=161(x2), r13=34(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 10
LDI r7, 45
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 135
LDI r12, 161
LDI r13, 34
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
