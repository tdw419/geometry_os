; DESCRIPTION: Composite: Draws a red line from (453, 125) to (238, 152) then Places a green dot at position (508, 235) then Renders a white disk with center (75, 115) and radius 40.
; PLAN: r0=453(x1), r1=125(y1), r2=238(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=115(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 125
LDI r2, 238
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 75
LDI r11, 115
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
