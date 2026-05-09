; DESCRIPTION: Composite: Sets a single black pixel at (41, 211) then Draws a white line from (125, 93) to (305, 23) then Renders a red disk with center (367, 121) and radius 51.
; PLAN: r0=41(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=93(y1), r7=305(x2), r8=23(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=121(y), r12=51(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 125
LDI r6, 93
LDI r7, 305
LDI r8, 23
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 121
LDI r12, 51
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
