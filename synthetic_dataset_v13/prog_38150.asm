; DESCRIPTION: Draws a green line from (495, 234) to (186, 4).
; PLAN: r0=495(x1), r1=234(y1), r2=186(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 234
LDI r2, 186
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
