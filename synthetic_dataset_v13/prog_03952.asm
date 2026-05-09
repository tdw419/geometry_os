; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (372, 100) then Renders a green line between points (311, 197) and (237, 187) then Places a white dot at position (95, 214).
; PLAN: r0=372(x), r1=100(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=197(y1), r7=237(x2), r8=187(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=214(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 100
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 197
LDI r7, 237
LDI r8, 187
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 214
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
