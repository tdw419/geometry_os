; DESCRIPTION: Composite: Draws a green line from (47, 196) to (105, 238) then Draws a purple circle centered at (277, 172) with radius 48 then Places a yellow dot at position (431, 102).
; PLAN: r0=47(x1), r1=196(y1), r2=105(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=172(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=102(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 196
LDI r2, 105
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 172
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 102
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
