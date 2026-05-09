; DESCRIPTION: Draws a black line from (195, 211) to (217, 225).
; PLAN: r0=195(x1), r1=211(y1), r2=217(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 211
LDI r2, 217
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
