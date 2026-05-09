; DESCRIPTION: Draws a green line from (110, 44) to (350, 235).
; PLAN: r0=110(x1), r1=44(y1), r2=350(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 44
LDI r2, 350
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
