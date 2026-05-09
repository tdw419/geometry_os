; DESCRIPTION: Composite: Creates a yellow circular shape at (471, 143) with radius 29 then Places a cyan dot at position (51, 202) then Draws a red line from (123, 148) to (457, 31).
; PLAN: r0=471(x), r1=143(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=202(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=123(x1), r11=148(y1), r12=457(x2), r13=31(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 143
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 202
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 148
LDI r12, 457
LDI r13, 31
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
