; DESCRIPTION: Composite: Draws a green line from (286, 141) to (316, 195) then Places a white circle of radius 27 at center (321, 36).
; PLAN: r0=286(x1), r1=141(y1), r2=316(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=36(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 141
LDI r2, 316
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 36
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
