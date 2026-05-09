; DESCRIPTION: Draws a green line from (295, 155) to (441, 150).
; PLAN: r0=295(x1), r1=155(y1), r2=441(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 155
LDI r2, 441
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
