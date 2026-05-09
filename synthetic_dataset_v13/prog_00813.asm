; DESCRIPTION: Draws a yellow line from (193, 65) to (434, 51).
; PLAN: r0=193(x1), r1=65(y1), r2=434(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 65
LDI r2, 434
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
