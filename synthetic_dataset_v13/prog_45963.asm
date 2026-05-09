; DESCRIPTION: Composite: Draws a white circle centered at (223, 111) with radius 74 then Draws a green line from (288, 159) to (119, 227) then Sets a single black pixel at (416, 60).
; PLAN: r0=223(x), r1=111(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=159(y1), r7=119(x2), r8=227(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=60(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 111
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 159
LDI r7, 119
LDI r8, 227
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 60
LDI r12, 0x000000
PSET r10, r11, r12
HALT
