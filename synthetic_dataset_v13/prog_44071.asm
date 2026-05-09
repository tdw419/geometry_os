; DESCRIPTION: Composite: Places a orange line segment connecting (208, 131) to (319, 27) then Places a green dot at position (160, 222).
; PLAN: r0=208(x1), r1=131(y1), r2=319(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 131
LDI r2, 319
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
