; DESCRIPTION: Composite: Places a magenta line segment connecting (342, 112) to (137, 197) then Places a blue dot at position (122, 252).
; PLAN: r0=342(x1), r1=112(y1), r2=137(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=252(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 112
LDI r2, 137
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 252
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
