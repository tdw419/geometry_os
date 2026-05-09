; DESCRIPTION: Composite: Sets a single purple pixel at (429, 12) then Renders a black line between points (175, 44) and (103, 175).
; PLAN: r0=429(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x1), r6=44(y1), r7=103(x2), r8=175(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 44
LDI r7, 103
LDI r8, 175
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
