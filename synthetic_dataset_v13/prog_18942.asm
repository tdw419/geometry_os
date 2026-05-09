; DESCRIPTION: Renders a red line between points (393, 236) and (208, 117).
; PLAN: r0=393(x1), r1=236(y1), r2=208(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 236
LDI r2, 208
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
