; DESCRIPTION: Composite: Creates a cyan circular shape at (449, 204) with radius 47 then Sets a single magenta pixel at (463, 55) then Draws a purple line from (366, 106) to (469, 199).
; PLAN: r0=449(x), r1=204(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=106(y1), r12=469(x2), r13=199(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 204
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 106
LDI r12, 469
LDI r13, 199
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
