; DESCRIPTION: Composite: Draws a magenta line from (369, 137) to (18, 13) then Places a white dot at position (19, 0).
; PLAN: r0=369(x1), r1=137(y1), r2=18(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=0(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 137
LDI r2, 18
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 0
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
