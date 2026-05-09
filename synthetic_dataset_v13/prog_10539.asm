; DESCRIPTION: Composite: Places a green dot at position (77, 79) then Draws a purple line from (98, 133) to (256, 6).
; PLAN: r0=77(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=98(x1), r6=133(y1), r7=256(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 98
LDI r6, 133
LDI r7, 256
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
