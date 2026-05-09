; DESCRIPTION: Composite: Places a cyan circle of radius 31 at center (109, 188) then Draws a cyan line from (85, 161) to (206, 246) then Places a black dot at position (165, 76).
; PLAN: r0=109(x), r1=188(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=161(y1), r7=206(x2), r8=246(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=76(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 188
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 161
LDI r7, 206
LDI r8, 246
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 76
LDI r12, 0x000000
PSET r10, r11, r12
HALT
