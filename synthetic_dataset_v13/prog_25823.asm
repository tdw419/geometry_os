; DESCRIPTION: Draws a magenta line from (44, 137) to (403, 37).
; PLAN: r0=44(x1), r1=137(y1), r2=403(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 137
LDI r2, 403
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
