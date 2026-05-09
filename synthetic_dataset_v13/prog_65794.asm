; DESCRIPTION: Draws a green line from (504, 179) to (7, 149).
; PLAN: r0=504(x1), r1=179(y1), r2=7(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 179
LDI r2, 7
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
