; DESCRIPTION: Composite: Places a magenta line segment connecting (325, 129) to (12, 250) then Places a orange dot at position (278, 127).
; PLAN: r0=325(x1), r1=129(y1), r2=12(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=127(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 129
LDI r2, 12
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 127
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
