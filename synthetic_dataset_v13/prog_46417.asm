; DESCRIPTION: Composite: Creates a white circular shape at (204, 103) with radius 25 then Draws a white line from (396, 99) to (107, 146) then Places a purple dot at position (117, 129).
; PLAN: r0=204(x), r1=103(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=99(y1), r7=107(x2), r8=146(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 103
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 99
LDI r7, 107
LDI r8, 146
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
