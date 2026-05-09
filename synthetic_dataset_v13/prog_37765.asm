; DESCRIPTION: Draws a green line from (203, 75) to (382, 225).
; PLAN: r0=203(x1), r1=75(y1), r2=382(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 75
LDI r2, 382
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
