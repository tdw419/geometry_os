; DESCRIPTION: Draws a green line from (250, 179) to (96, 46).
; PLAN: r0=250(x1), r1=179(y1), r2=96(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 179
LDI r2, 96
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
