; DESCRIPTION: Composite: Places a purple dot at position (120, 0) then Places a white line segment connecting (493, 26) to (434, 208).
; PLAN: r0=120(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=26(y1), r7=434(x2), r8=208(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 26
LDI r7, 434
LDI r8, 208
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
