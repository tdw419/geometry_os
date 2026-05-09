; DESCRIPTION: Composite: Sets a single orange pixel at (488, 121) then Draws a purple line from (474, 50) to (150, 34).
; PLAN: r0=488(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=50(y1), r7=150(x2), r8=34(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 488
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 474
LDI r6, 50
LDI r7, 150
LDI r8, 34
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
