; DESCRIPTION: Composite: Renders a magenta line between points (143, 164) and (437, 35) then Draws a white circle centered at (175, 89) with radius 71 then Places a black dot at position (374, 108).
; PLAN: r0=143(x1), r1=164(y1), r2=437(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=89(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=108(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 164
LDI r2, 437
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 89
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 108
LDI r12, 0x000000
PSET r10, r11, r12
HALT
