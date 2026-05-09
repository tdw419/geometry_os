; DESCRIPTION: Composite: Renders a magenta disk with center (326, 153) and radius 79 then Draws a magenta line from (124, 18) to (106, 93) then Places a black dot at position (461, 187).
; PLAN: r0=326(x), r1=153(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=18(y1), r7=106(x2), r8=93(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=461(x), r11=187(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 153
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 18
LDI r7, 106
LDI r8, 93
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 187
LDI r12, 0x000000
PSET r10, r11, r12
HALT
