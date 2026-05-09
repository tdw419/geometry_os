; DESCRIPTION: Composite: Draws a blue circle centered at (339, 193) with radius 54 then Sets a single red pixel at (483, 187) then Draws a cyan line from (210, 75) to (108, 83).
; PLAN: r0=339(x), r1=193(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=210(x1), r11=75(y1), r12=108(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 193
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 210
LDI r11, 75
LDI r12, 108
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
