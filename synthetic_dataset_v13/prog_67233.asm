; DESCRIPTION: Draws a green line from (498, 118) to (269, 127).
; PLAN: r0=498(x1), r1=118(y1), r2=269(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 118
LDI r2, 269
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
