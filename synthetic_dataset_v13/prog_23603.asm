; DESCRIPTION: Draws a yellow line from (500, 46) to (433, 236).
; PLAN: r0=500(x1), r1=46(y1), r2=433(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 46
LDI r2, 433
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
