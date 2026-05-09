; DESCRIPTION: Draws a white line from (486, 107) to (110, 221).
; PLAN: r0=486(x1), r1=107(y1), r2=110(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 107
LDI r2, 110
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
