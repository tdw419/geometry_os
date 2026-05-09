; DESCRIPTION: Renders a red line between points (179, 107) and (333, 70).
; PLAN: r0=179(x1), r1=107(y1), r2=333(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 107
LDI r2, 333
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
