; DESCRIPTION: Composite: Draws a green line from (215, 43) to (399, 15) then Draws a green circle centered at (85, 204) with radius 41 then Places a green dot at position (98, 91).
; PLAN: r0=215(x1), r1=43(y1), r2=399(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=204(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=91(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 43
LDI r2, 399
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 204
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 91
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
