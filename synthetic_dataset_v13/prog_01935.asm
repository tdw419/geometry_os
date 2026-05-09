; DESCRIPTION: Composite: Draws a red rectangle at (108, 115) with width 83 and height 97 then Sets a single yellow pixel at (20, 44) then Renders a magenta line between points (272, 70) and (473, 251).
; PLAN: r0=108(x), r1=115(y), r2=83(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=44(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=272(x1), r11=70(y1), r12=473(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 115
LDI r2, 83
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 44
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 70
LDI r12, 473
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
