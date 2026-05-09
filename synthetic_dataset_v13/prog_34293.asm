; DESCRIPTION: Draws a green line from (511, 94) to (392, 79).
; PLAN: r0=511(x1), r1=94(y1), r2=392(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 94
LDI r2, 392
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
