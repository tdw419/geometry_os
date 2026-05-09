; DESCRIPTION: Composite: Creates a yellow circular shape at (134, 121) with radius 71 then Places a magenta line segment connecting (492, 247) to (300, 41) then Places a black dot at position (125, 161).
; PLAN: r0=134(x), r1=121(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=247(y1), r7=300(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=161(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 121
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 247
LDI r7, 300
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 161
LDI r12, 0x000000
PSET r10, r11, r12
HALT
