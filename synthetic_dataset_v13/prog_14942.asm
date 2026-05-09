; DESCRIPTION: Draws a white line from (27, 89) to (434, 58).
; PLAN: r0=27(x1), r1=89(y1), r2=434(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 89
LDI r2, 434
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
