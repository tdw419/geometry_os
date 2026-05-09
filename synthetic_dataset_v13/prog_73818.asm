; DESCRIPTION: Composite: Renders a magenta line between points (23, 97) and (453, 121) then Places a white dot at position (231, 114).
; PLAN: r0=23(x1), r1=97(y1), r2=453(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=114(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 97
LDI r2, 453
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 114
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
