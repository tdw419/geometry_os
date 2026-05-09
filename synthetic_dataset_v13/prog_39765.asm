; DESCRIPTION: Composite: Places a green dot at position (417, 69) then Draws a yellow line from (46, 220) to (361, 119).
; PLAN: r0=417(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=220(y1), r7=361(x2), r8=119(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 69
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 46
LDI r6, 220
LDI r7, 361
LDI r8, 119
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
