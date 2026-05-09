; DESCRIPTION: Composite: Places a purple dot at position (21, 188) then Renders a white line between points (310, 42) and (248, 145).
; PLAN: r0=21(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=42(y1), r7=248(x2), r8=145(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 42
LDI r7, 248
LDI r8, 145
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
