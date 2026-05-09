; DESCRIPTION: Composite: Places a purple dot at position (340, 110) then Draws a black line from (21, 250) to (403, 80).
; PLAN: r0=340(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=250(y1), r7=403(x2), r8=80(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 110
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 250
LDI r7, 403
LDI r8, 80
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
