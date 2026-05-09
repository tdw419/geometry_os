; DESCRIPTION: Composite: Places a blue dot at position (350, 90) then Places a black line segment connecting (148, 11) to (406, 195).
; PLAN: r0=350(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=11(y1), r7=406(x2), r8=195(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 11
LDI r7, 406
LDI r8, 195
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
