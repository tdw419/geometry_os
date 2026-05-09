; DESCRIPTION: Composite: Places a white line segment connecting (120, 99) to (300, 212) then Places a orange dot at position (318, 190).
; PLAN: r0=120(x1), r1=99(y1), r2=300(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=190(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 99
LDI r2, 300
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 190
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
