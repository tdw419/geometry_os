; DESCRIPTION: Composite: Sets a single cyan pixel at (31, 140) then Draws a black rectangle at (203, 45) with width 32 and height 23 then Renders a purple line between points (29, 229) and (107, 174).
; PLAN: r0=31(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=45(y), r7=32(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=29(x1), r11=229(y1), r12=107(x2), r13=174(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 45
LDI r7, 32
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 229
LDI r12, 107
LDI r13, 174
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
