; DESCRIPTION: Composite: Renders a orange line between points (497, 154) and (314, 53) then Places a green dot at position (263, 60).
; PLAN: r0=497(x1), r1=154(y1), r2=314(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 497
LDI r1, 154
LDI r2, 314
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
