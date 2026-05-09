; DESCRIPTION: Composite: Places a green line segment connecting (352, 146) to (428, 172) then Places a yellow dot at position (396, 160).
; PLAN: r0=352(x1), r1=146(y1), r2=428(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=160(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 146
LDI r2, 428
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 160
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
