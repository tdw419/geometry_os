; DESCRIPTION: Composite: Places a green circle of radius 22 at center (107, 192) then Draws a red line from (431, 57) to (17, 134) then Places a magenta dot at position (461, 207).
; PLAN: r0=107(x), r1=192(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=57(y1), r7=17(x2), r8=134(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=461(x), r11=207(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 192
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 57
LDI r7, 17
LDI r8, 134
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 207
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
