; DESCRIPTION: Composite: Places a green line segment connecting (155, 132) to (453, 205) then Sets a single cyan pixel at (0, 0).
; PLAN: r0=155(x1), r1=132(y1), r2=453(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=0(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 132
LDI r2, 453
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 0
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
