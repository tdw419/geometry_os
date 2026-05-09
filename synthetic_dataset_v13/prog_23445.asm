; DESCRIPTION: Composite: Places a yellow dot at position (333, 26) then Renders a magenta line between points (310, 250) and (127, 177).
; PLAN: r0=333(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=250(y1), r7=127(x2), r8=177(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 310
LDI r6, 250
LDI r7, 127
LDI r8, 177
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
