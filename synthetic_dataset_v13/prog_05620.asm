; DESCRIPTION: Composite: Places a purple dot at position (127, 62) then Draws a green line from (417, 176) to (96, 184).
; PLAN: r0=127(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=176(y1), r7=96(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 176
LDI r7, 96
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
