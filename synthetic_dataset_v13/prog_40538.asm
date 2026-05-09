; DESCRIPTION: Composite: Places a magenta circle of radius 11 at center (229, 182) then Renders a cyan line between points (422, 125) and (7, 174) then Places a purple dot at position (211, 47).
; PLAN: r0=229(x), r1=182(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=125(y1), r7=7(x2), r8=174(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=47(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 182
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 125
LDI r7, 7
LDI r8, 174
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 47
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
