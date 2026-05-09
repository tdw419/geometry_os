; DESCRIPTION: Composite: Places a white line segment connecting (42, 187) to (395, 159) then Places a green dot at position (407, 55).
; PLAN: r0=42(x1), r1=187(y1), r2=395(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=55(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 187
LDI r2, 395
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 55
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
