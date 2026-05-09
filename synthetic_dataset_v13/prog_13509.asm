; DESCRIPTION: Composite: Sets a single blue pixel at (24, 161) then Draws a black line from (370, 250) to (303, 28).
; PLAN: r0=24(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=250(y1), r7=303(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 250
LDI r7, 303
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
