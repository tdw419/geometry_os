; DESCRIPTION: Composite: Draws a black circle centered at (108, 166) with radius 66 then Places a green line segment connecting (81, 250) to (489, 25) then Places a red dot at position (305, 13).
; PLAN: r0=108(x), r1=166(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=250(y1), r7=489(x2), r8=25(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=13(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 166
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 250
LDI r7, 489
LDI r8, 25
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 13
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
