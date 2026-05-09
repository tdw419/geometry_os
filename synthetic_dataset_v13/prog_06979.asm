; DESCRIPTION: Composite: Places a yellow dot at position (55, 66) then Places a magenta line segment connecting (463, 208) to (330, 89).
; PLAN: r0=55(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=463(x1), r6=208(y1), r7=330(x2), r8=89(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 463
LDI r6, 208
LDI r7, 330
LDI r8, 89
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
