; DESCRIPTION: Draws a green line from (177, 2) to (338, 37).
; PLAN: r0=177(x1), r1=2(y1), r2=338(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 2
LDI r2, 338
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
