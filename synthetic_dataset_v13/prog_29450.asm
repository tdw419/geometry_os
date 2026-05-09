; DESCRIPTION: Draws a green line from (368, 66) to (66, 10).
; PLAN: r0=368(x1), r1=66(y1), r2=66(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 66
LDI r2, 66
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
