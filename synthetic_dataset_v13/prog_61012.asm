; DESCRIPTION: Draws a purple line from (281, 146) to (425, 221).
; PLAN: r0=281(x1), r1=146(y1), r2=425(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 146
LDI r2, 425
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
