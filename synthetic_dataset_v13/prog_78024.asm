; DESCRIPTION: Composite: Renders a purple disk with center (302, 187) and radius 29 then Draws a red line from (208, 186) to (207, 100) then Places a white dot at position (479, 207).
; PLAN: r0=302(x), r1=187(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=186(y1), r7=207(x2), r8=100(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=207(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 187
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 186
LDI r7, 207
LDI r8, 100
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 207
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
