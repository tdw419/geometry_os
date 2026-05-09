; DESCRIPTION: Composite: Draws a yellow line from (34, 9) to (206, 60) then Sets a single black pixel at (15, 103).
; PLAN: r0=34(x1), r1=9(y1), r2=206(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=103(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 9
LDI r2, 206
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 103
LDI r7, 0x000000
PSET r5, r6, r7
HALT
