; DESCRIPTION: Composite: Places a yellow 98x45 rectangle at position (320, 40) then Sets a single orange pixel at (338, 186) then Draws a red line from (309, 229) to (15, 209).
; PLAN: r0=320(x), r1=40(y), r2=98(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=309(x1), r11=229(y1), r12=15(x2), r13=209(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 40
LDI r2, 98
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 309
LDI r11, 229
LDI r12, 15
LDI r13, 209
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
