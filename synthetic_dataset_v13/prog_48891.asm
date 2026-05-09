; DESCRIPTION: Composite: Places a black dot at position (345, 85) then Draws a yellow line from (94, 87) to (46, 22).
; PLAN: r0=345(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=87(y1), r7=46(x2), r8=22(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 87
LDI r7, 46
LDI r8, 22
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
