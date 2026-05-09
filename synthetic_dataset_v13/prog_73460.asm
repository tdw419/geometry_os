; DESCRIPTION: Composite: Draws a cyan rectangle at (424, 176) with width 70 and height 61 then Sets a single red pixel at (172, 193) then Draws a yellow line from (184, 65) to (322, 219).
; PLAN: r0=424(x), r1=176(y), r2=70(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=193(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=184(x1), r11=65(y1), r12=322(x2), r13=219(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 176
LDI r2, 70
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 193
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 184
LDI r11, 65
LDI r12, 322
LDI r13, 219
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
