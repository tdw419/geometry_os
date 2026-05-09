; DESCRIPTION: Composite: Sets a single purple pixel at (157, 141) then Draws a yellow line from (219, 46) to (315, 246).
; PLAN: r0=157(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=46(y1), r7=315(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 46
LDI r7, 315
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
