; DESCRIPTION: Draws a green line from (114, 94) to (428, 177).
; PLAN: r0=114(x1), r1=94(y1), r2=428(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 94
LDI r2, 428
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
