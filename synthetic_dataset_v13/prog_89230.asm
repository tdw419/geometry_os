; DESCRIPTION: Composite: Creates a blue circular shape at (364, 143) with radius 46 then Renders a magenta line between points (449, 220) and (230, 247) then Draws a cyan rectangle at (68, 145) with width 55 and height 72.
; PLAN: r0=364(x), r1=143(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=220(y1), r7=230(x2), r8=247(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=145(y), r12=55(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 143
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 220
LDI r7, 230
LDI r8, 247
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 145
LDI r12, 55
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
