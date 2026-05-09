; DESCRIPTION: Composite: Places a purple dot at position (175, 89) then Places a green line segment connecting (149, 120) to (499, 154).
; PLAN: r0=175(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=120(y1), r7=499(x2), r8=154(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 120
LDI r7, 499
LDI r8, 154
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
