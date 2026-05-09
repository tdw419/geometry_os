; DESCRIPTION: Composite: Places a purple dot at position (77, 247) then Draws a purple rectangle at (185, 16) with width 115 and height 86 then Draws a magenta line from (335, 8) to (404, 29).
; PLAN: r0=77(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=16(y), r7=115(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x1), r11=8(y1), r12=404(x2), r13=29(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 16
LDI r7, 115
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 8
LDI r12, 404
LDI r13, 29
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
