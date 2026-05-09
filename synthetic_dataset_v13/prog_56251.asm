; DESCRIPTION: Renders a magenta line between points (408, 41) and (295, 179).
; PLAN: r0=408(x1), r1=41(y1), r2=295(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 41
LDI r2, 295
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
