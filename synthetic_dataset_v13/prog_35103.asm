; DESCRIPTION: Composite: Draws a yellow line from (454, 90) to (81, 221) then Sets a single white pixel at (200, 126) then Places a yellow circle of radius 71 at center (146, 163).
; PLAN: r0=454(x1), r1=90(y1), r2=81(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=163(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 90
LDI r2, 81
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 163
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
