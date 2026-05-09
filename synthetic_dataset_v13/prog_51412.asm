; DESCRIPTION: Draws a purple line from (272, 120) to (386, 217).
; PLAN: r0=272(x1), r1=120(y1), r2=386(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 120
LDI r2, 386
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
