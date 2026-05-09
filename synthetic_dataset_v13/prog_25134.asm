; DESCRIPTION: Draws a green line from (186, 132) to (172, 1).
; PLAN: r0=186(x1), r1=132(y1), r2=172(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 132
LDI r2, 172
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
