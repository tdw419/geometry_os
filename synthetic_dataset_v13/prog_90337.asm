; DESCRIPTION: Composite: Places a blue dot at position (235, 8) then Draws a purple line from (45, 59) to (83, 86).
; PLAN: r0=235(x), r1=8(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=59(y1), r7=83(x2), r8=86(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 8
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 59
LDI r7, 83
LDI r8, 86
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
