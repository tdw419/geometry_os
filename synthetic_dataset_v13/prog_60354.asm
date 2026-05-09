; DESCRIPTION: Composite: Places a magenta line segment connecting (127, 24) to (460, 54) then Sets a single blue pixel at (91, 203).
; PLAN: r0=127(x1), r1=24(y1), r2=460(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=203(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 24
LDI r2, 460
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 203
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
