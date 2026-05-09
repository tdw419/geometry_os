; DESCRIPTION: Draws a purple line from (272, 9) to (403, 48).
; PLAN: r0=272(x1), r1=9(y1), r2=403(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 9
LDI r2, 403
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
