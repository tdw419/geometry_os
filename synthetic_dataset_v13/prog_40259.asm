; DESCRIPTION: Composite: Sets a single black pixel at (272, 187) then Draws a blue line from (32, 130) to (36, 109).
; PLAN: r0=272(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=32(x1), r6=130(y1), r7=36(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 32
LDI r6, 130
LDI r7, 36
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
