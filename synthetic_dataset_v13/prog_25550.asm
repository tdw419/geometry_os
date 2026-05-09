; DESCRIPTION: Composite: Sets a single magenta pixel at (459, 83) then Renders a black line between points (332, 34) and (183, 213).
; PLAN: r0=459(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=332(x1), r6=34(y1), r7=183(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 83
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 34
LDI r7, 183
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
