; DESCRIPTION: Composite: Draws a orange circle centered at (391, 194) with radius 13 then Sets a single orange pixel at (112, 61) then Draws a cyan line from (456, 74) to (347, 223).
; PLAN: r0=391(x), r1=194(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=61(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=456(x1), r11=74(y1), r12=347(x2), r13=223(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 194
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 61
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 456
LDI r11, 74
LDI r12, 347
LDI r13, 223
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
