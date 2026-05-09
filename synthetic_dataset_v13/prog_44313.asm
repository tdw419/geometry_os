; DESCRIPTION: Renders a red line between points (281, 141) and (179, 66).
; PLAN: r0=281(x1), r1=141(y1), r2=179(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 141
LDI r2, 179
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
