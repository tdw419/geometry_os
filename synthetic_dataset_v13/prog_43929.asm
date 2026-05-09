; DESCRIPTION: Composite: Places a green dot at position (33, 242) then Renders a blue line between points (444, 137) and (399, 158).
; PLAN: r0=33(x), r1=242(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=137(y1), r7=399(x2), r8=158(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 242
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 444
LDI r6, 137
LDI r7, 399
LDI r8, 158
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
