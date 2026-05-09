; DESCRIPTION: Composite: Places a white line segment connecting (23, 207) to (268, 108) then Places a yellow dot at position (174, 161).
; PLAN: r0=23(x1), r1=207(y1), r2=268(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 207
LDI r2, 268
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
