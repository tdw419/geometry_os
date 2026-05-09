; DESCRIPTION: Draws a green line from (441, 72) to (9, 236).
; PLAN: r0=441(x1), r1=72(y1), r2=9(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 72
LDI r2, 9
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
