; DESCRIPTION: Draws a green line from (350, 199) to (286, 12).
; PLAN: r0=350(x1), r1=199(y1), r2=286(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 199
LDI r2, 286
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
