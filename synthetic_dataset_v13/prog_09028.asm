; DESCRIPTION: Composite: Draws a cyan rectangle at (382, 176) with width 20 and height 51 then Sets a single red pixel at (245, 192) then Draws a cyan line from (195, 82) to (483, 68).
; PLAN: r0=382(x), r1=176(y), r2=20(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=195(x1), r11=82(y1), r12=483(x2), r13=68(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 176
LDI r2, 20
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 82
LDI r12, 483
LDI r13, 68
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
