; DESCRIPTION: Composite: Sets a single black pixel at (117, 23) then Draws a purple line from (391, 219) to (213, 157).
; PLAN: r0=117(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=219(y1), r7=213(x2), r8=157(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 219
LDI r7, 213
LDI r8, 157
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
