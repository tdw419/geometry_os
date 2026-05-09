; DESCRIPTION: Composite: Sets a single white pixel at (320, 176) then Renders a orange line between points (75, 203) and (226, 221).
; PLAN: r0=320(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=203(y1), r7=226(x2), r8=221(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 203
LDI r7, 226
LDI r8, 221
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
