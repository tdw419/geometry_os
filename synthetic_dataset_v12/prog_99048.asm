; DESCRIPTION: Composite: Places a purple dot at position (123, 120) then Renders a white line between points (376, 167) and (320, 226).
; PLAN: r0=123(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=167(y1), r7=320(x2), r8=226(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 167
LDI r7, 320
LDI r8, 226
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
