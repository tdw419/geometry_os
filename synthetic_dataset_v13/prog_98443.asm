; DESCRIPTION: Composite: Renders a white line between points (110, 223) and (354, 68) then Sets a single green pixel at (80, 96).
; PLAN: r0=110(x1), r1=223(y1), r2=354(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=96(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 223
LDI r2, 354
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 96
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
