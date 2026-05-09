; DESCRIPTION: Renders a yellow line between points (370, 66) and (87, 177).
; PLAN: r0=370(x1), r1=66(y1), r2=87(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 66
LDI r2, 87
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
