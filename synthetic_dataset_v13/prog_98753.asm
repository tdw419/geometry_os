; DESCRIPTION: Draws a yellow line from (157, 10) to (195, 174).
; PLAN: r0=157(x1), r1=10(y1), r2=195(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 10
LDI r2, 195
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
