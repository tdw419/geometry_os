; DESCRIPTION: Composite: Places a purple dot at position (66, 111) then Places a black line segment connecting (192, 159) to (152, 119).
; PLAN: r0=66(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=159(y1), r7=152(x2), r8=119(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 159
LDI r7, 152
LDI r8, 119
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
