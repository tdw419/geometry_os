; DESCRIPTION: Draws a purple line from (305, 254) to (171, 229).
; PLAN: r0=305(x1), r1=254(y1), r2=171(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 254
LDI r2, 171
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
