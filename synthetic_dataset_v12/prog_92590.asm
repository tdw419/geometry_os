; DESCRIPTION: Draws a cyan line from (462, 118) to (379, 191).
; PLAN: r0=462(x1), r1=118(y1), r2=379(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 118
LDI r2, 379
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
