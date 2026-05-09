; DESCRIPTION: Composite: Places a black dot at position (175, 40) then Creates a cyan circular shape at (268, 99) with radius 25 then Draws a blue line from (505, 83) to (277, 8).
; PLAN: r0=175(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=99(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=83(y1), r12=277(x2), r13=8(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 99
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 83
LDI r12, 277
LDI r13, 8
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
