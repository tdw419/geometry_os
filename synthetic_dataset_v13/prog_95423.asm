; DESCRIPTION: Composite: Draws a cyan line from (171, 169) to (424, 199) then Places a green circle of radius 47 at center (168, 163) then Places a green dot at position (164, 41).
; PLAN: r0=171(x1), r1=169(y1), r2=424(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=163(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 169
LDI r2, 424
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 163
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
