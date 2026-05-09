; DESCRIPTION: Composite: Places a purple dot at position (26, 99) then Draws a green line from (178, 233) to (440, 226).
; PLAN: r0=26(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=233(y1), r7=440(x2), r8=226(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 233
LDI r7, 440
LDI r8, 226
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
