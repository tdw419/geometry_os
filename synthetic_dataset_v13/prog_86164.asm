; DESCRIPTION: Composite: Draws a green rectangle at (207, 115) with width 94 and height 14 then Sets a single blue pixel at (137, 152) then Draws a white line from (193, 163) to (341, 65).
; PLAN: r0=207(x), r1=115(y), r2=94(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=152(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=193(x1), r11=163(y1), r12=341(x2), r13=65(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 115
LDI r2, 94
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 152
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 193
LDI r11, 163
LDI r12, 341
LDI r13, 65
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
