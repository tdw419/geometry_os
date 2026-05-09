; DESCRIPTION: Composite: Places a blue circle of radius 19 at center (178, 183) then Draws a green line from (179, 19) to (221, 184) then Sets a single black pixel at (502, 247).
; PLAN: r0=178(x), r1=183(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x1), r6=19(y1), r7=221(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=247(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 183
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 19
LDI r7, 221
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 247
LDI r12, 0x000000
PSET r10, r11, r12
HALT
