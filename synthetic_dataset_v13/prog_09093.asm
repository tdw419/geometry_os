; DESCRIPTION: Draws a cyan line from (52, 229) to (132, 10).
; PLAN: r0=52(x1), r1=229(y1), r2=132(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 229
LDI r2, 132
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
