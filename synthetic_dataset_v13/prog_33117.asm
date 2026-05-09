; DESCRIPTION: Composite: Creates a yellow rectangular region at (325, 199) spanning 46 by 10 pixels then Renders a red line between points (179, 87) and (325, 234) then Places a yellow dot at position (433, 243).
; PLAN: r0=325(x), r1=199(y), r2=46(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x1), r6=87(y1), r7=325(x2), r8=234(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=243(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 199
LDI r2, 46
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 87
LDI r7, 325
LDI r8, 234
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 243
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
