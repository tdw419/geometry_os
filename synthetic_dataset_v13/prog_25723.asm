; DESCRIPTION: Composite: Places a orange dot at position (25, 82) then Places a magenta line segment connecting (443, 243) to (223, 109).
; PLAN: r0=25(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=443(x1), r6=243(y1), r7=223(x2), r8=109(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 443
LDI r6, 243
LDI r7, 223
LDI r8, 109
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
