; DESCRIPTION: Renders a green line between points (94, 28) and (105, 177).
; PLAN: r0=94(x1), r1=28(y1), r2=105(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 28
LDI r2, 105
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
