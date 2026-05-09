; DESCRIPTION: Composite: Places a black dot at position (242, 37) then Draws a green line from (384, 137) to (345, 75).
; PLAN: r0=242(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=137(y1), r7=345(x2), r8=75(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 384
LDI r6, 137
LDI r7, 345
LDI r8, 75
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
