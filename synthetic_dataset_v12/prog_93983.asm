; DESCRIPTION: Composite: Draws a orange line from (91, 204) to (384, 222) then Renders a yellow box of size 57x89 starting at (138, 26) then Sets a single green pixel at (185, 30).
; PLAN: r0=91(x1), r1=204(y1), r2=384(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=26(y), r7=57(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x), r11=30(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 204
LDI r2, 384
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 26
LDI r7, 57
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 30
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
