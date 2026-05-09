; DESCRIPTION: Draws a green line from (393, 37) to (98, 199).
; PLAN: r0=393(x1), r1=37(y1), r2=98(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 37
LDI r2, 98
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
