; DESCRIPTION: Composite: Sets a single white pixel at (420, 87) then Renders a cyan line between points (207, 52) and (24, 44).
; PLAN: r0=420(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=52(y1), r7=24(x2), r8=44(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 52
LDI r7, 24
LDI r8, 44
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
