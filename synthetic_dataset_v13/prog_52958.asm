; DESCRIPTION: Composite: Draws a cyan line from (83, 170) to (94, 208) then Places a cyan dot at position (434, 122) then Draws a yellow rectangle at (140, 95) with width 60 and height 23.
; PLAN: r0=83(x1), r1=170(y1), r2=94(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=122(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=140(x), r11=95(y), r12=60(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 170
LDI r2, 94
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 122
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 140
LDI r11, 95
LDI r12, 60
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
