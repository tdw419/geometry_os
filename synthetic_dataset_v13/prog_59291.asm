; DESCRIPTION: Composite: Draws a green circle centered at (70, 204) with radius 22 then Places a blue dot at position (273, 187) then Places a cyan line segment connecting (276, 99) to (206, 118).
; PLAN: r0=70(x), r1=204(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=276(x1), r11=99(y1), r12=206(x2), r13=118(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 204
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 99
LDI r12, 206
LDI r13, 118
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
