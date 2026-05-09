; DESCRIPTION: Composite: Places a purple line segment connecting (207, 8) to (124, 84) then Places a yellow dot at position (30, 213).
; PLAN: r0=207(x1), r1=8(y1), r2=124(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=213(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 8
LDI r2, 124
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 213
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
