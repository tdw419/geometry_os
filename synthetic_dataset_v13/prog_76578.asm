; DESCRIPTION: Composite: Draws a yellow rectangle at (70, 28) with width 87 and height 22 then Sets a single red pixel at (486, 192) then Renders a cyan line between points (250, 176) and (263, 35).
; PLAN: r0=70(x), r1=28(y), r2=87(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=250(x1), r11=176(y1), r12=263(x2), r13=35(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 28
LDI r2, 87
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 250
LDI r11, 176
LDI r12, 263
LDI r13, 35
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
