; DESCRIPTION: Composite: Places a blue dot at position (275, 123) then Places a magenta line segment connecting (144, 88) to (77, 110).
; PLAN: r0=275(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=88(y1), r7=77(x2), r8=110(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 88
LDI r7, 77
LDI r8, 110
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
