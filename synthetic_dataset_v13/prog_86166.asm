; DESCRIPTION: Composite: Places a magenta circle of radius 27 at center (483, 79) then Draws a magenta line from (385, 41) to (124, 192) then Places a green dot at position (465, 55).
; PLAN: r0=483(x), r1=79(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=41(y1), r7=124(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=55(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 79
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 41
LDI r7, 124
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 55
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
