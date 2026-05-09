; DESCRIPTION: Composite: Creates a blue circular shape at (418, 86) with radius 51 then Places a orange dot at position (372, 23) then Draws a red line from (16, 118) to (191, 51).
; PLAN: r0=418(x), r1=86(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=16(x1), r11=118(y1), r12=191(x2), r13=51(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 86
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 16
LDI r11, 118
LDI r12, 191
LDI r13, 51
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
