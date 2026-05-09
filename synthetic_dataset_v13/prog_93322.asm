; DESCRIPTION: Composite: Sets a single purple pixel at (382, 111) then Draws a orange line from (103, 226) to (133, 252).
; PLAN: r0=382(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=103(x1), r6=226(y1), r7=133(x2), r8=252(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 226
LDI r7, 133
LDI r8, 252
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
