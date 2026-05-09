; DESCRIPTION: Draws a green line from (251, 193) to (495, 202).
; PLAN: r0=251(x1), r1=193(y1), r2=495(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 193
LDI r2, 495
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
