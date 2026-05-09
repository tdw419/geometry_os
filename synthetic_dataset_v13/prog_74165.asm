; DESCRIPTION: Draws a cyan line from (142, 89) to (174, 61).
; PLAN: r0=142(x1), r1=89(y1), r2=174(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 89
LDI r2, 174
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
