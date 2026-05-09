; DESCRIPTION: Composite: Renders a orange line between points (187, 129) and (495, 155) then Places a orange dot at position (439, 98).
; PLAN: r0=187(x1), r1=129(y1), r2=495(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=98(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 129
LDI r2, 495
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 98
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
