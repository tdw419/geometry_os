; DESCRIPTION: Composite: Draws a purple line from (385, 26) to (154, 165) then Places a white dot at position (274, 0).
; PLAN: r0=385(x1), r1=26(y1), r2=154(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=0(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 26
LDI r2, 154
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 0
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
