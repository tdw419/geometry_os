; DESCRIPTION: Draws a green line from (10, 89) to (132, 228).
; PLAN: r0=10(x1), r1=89(y1), r2=132(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 89
LDI r2, 132
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
