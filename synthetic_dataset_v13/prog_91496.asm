; DESCRIPTION: Draws a green line from (202, 107) to (247, 216).
; PLAN: r0=202(x1), r1=107(y1), r2=247(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 107
LDI r2, 247
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
