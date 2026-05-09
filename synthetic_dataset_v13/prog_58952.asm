; DESCRIPTION: Draws a green line from (39, 177) to (77, 203).
; PLAN: r0=39(x1), r1=177(y1), r2=77(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 177
LDI r2, 77
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
