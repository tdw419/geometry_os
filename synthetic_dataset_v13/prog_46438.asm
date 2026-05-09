; DESCRIPTION: Composite: Renders a cyan line between points (149, 80) and (271, 251) then Places a orange dot at position (464, 13).
; PLAN: r0=149(x1), r1=80(y1), r2=271(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 80
LDI r2, 271
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
