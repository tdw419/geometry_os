; DESCRIPTION: Composite: Draws a yellow line from (460, 252) to (199, 154) then Draws a cyan circle centered at (157, 85) with radius 68 then Places a green dot at position (380, 11).
; PLAN: r0=460(x1), r1=252(y1), r2=199(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=85(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=11(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 252
LDI r2, 199
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 85
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 11
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
