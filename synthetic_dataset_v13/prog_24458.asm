; DESCRIPTION: Draws a green line from (408, 3) to (186, 250).
; PLAN: r0=408(x1), r1=3(y1), r2=186(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 3
LDI r2, 186
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
