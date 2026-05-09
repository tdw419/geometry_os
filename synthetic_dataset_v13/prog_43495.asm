; DESCRIPTION: Draws a green line from (281, 160) to (439, 51).
; PLAN: r0=281(x1), r1=160(y1), r2=439(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 160
LDI r2, 439
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
