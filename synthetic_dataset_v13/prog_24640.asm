; DESCRIPTION: Draws a yellow line from (355, 107) to (187, 179).
; PLAN: r0=355(x1), r1=107(y1), r2=187(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 107
LDI r2, 187
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
