; DESCRIPTION: Composite: Sets a single purple pixel at (380, 79) then Places a orange line segment connecting (306, 72) to (111, 197).
; PLAN: r0=380(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=72(y1), r7=111(x2), r8=197(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 72
LDI r7, 111
LDI r8, 197
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
