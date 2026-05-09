; DESCRIPTION: Composite: Creates a black circular shape at (229, 43) with radius 33 then Draws a white line from (215, 29) to (135, 41) then Places a green dot at position (219, 161).
; PLAN: r0=229(x), r1=43(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=29(y1), r7=135(x2), r8=41(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=161(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 43
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 29
LDI r7, 135
LDI r8, 41
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 161
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
