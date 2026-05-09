; DESCRIPTION: Composite: Sets a single purple pixel at (198, 28) then Renders a red line between points (449, 122) and (206, 237).
; PLAN: r0=198(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=449(x1), r6=122(y1), r7=206(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 449
LDI r6, 122
LDI r7, 206
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
