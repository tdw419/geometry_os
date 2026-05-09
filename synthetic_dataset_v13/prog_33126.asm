; DESCRIPTION: Composite: Places a green dot at position (211, 184) then Renders a magenta line between points (236, 219) and (2, 207).
; PLAN: r0=211(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=219(y1), r7=2(x2), r8=207(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 236
LDI r6, 219
LDI r7, 2
LDI r8, 207
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
