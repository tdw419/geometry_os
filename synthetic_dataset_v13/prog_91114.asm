; DESCRIPTION: Draws a white line from (181, 144) to (177, 198).
; PLAN: r0=181(x1), r1=144(y1), r2=177(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 144
LDI r2, 177
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
