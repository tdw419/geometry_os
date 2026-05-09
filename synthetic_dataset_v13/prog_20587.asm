; DESCRIPTION: Composite: Places a red line segment connecting (185, 39) to (368, 232) then Places a yellow dot at position (466, 211) then Draws a cyan rectangle at (30, 9) with width 98 and height 36.
; PLAN: r0=185(x1), r1=39(y1), r2=368(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=211(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=30(x), r11=9(y), r12=98(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 39
LDI r2, 368
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 211
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 30
LDI r11, 9
LDI r12, 98
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
