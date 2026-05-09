; DESCRIPTION: Composite: Renders a purple line between points (230, 50) and (214, 8) then Sets a single black pixel at (120, 57).
; PLAN: r0=230(x1), r1=50(y1), r2=214(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=57(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 50
LDI r2, 214
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 57
LDI r7, 0x000000
PSET r5, r6, r7
HALT
