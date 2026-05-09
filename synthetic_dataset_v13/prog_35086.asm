; DESCRIPTION: Composite: Places a green dot at position (159, 49) then Draws a magenta line from (140, 49) to (310, 242).
; PLAN: r0=159(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=140(x1), r6=49(y1), r7=310(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 140
LDI r6, 49
LDI r7, 310
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
