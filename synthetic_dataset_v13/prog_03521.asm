; DESCRIPTION: Composite: Places a green line segment connecting (186, 178) to (350, 99) then Places a green dot at position (341, 183).
; PLAN: r0=186(x1), r1=178(y1), r2=350(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 178
LDI r2, 350
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
