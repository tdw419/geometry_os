; DESCRIPTION: Composite: Renders a blue disk with center (244, 103) and radius 39 then Renders a cyan line between points (95, 102) and (66, 100) then Places a cyan dot at position (389, 121).
; PLAN: r0=244(x), r1=103(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x1), r6=102(y1), r7=66(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=121(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 103
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 102
LDI r7, 66
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 121
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
