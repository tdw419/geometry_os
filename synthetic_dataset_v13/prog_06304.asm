; DESCRIPTION: Renders a cyan line between points (177, 141) and (377, 74).
; PLAN: r0=177(x1), r1=141(y1), r2=377(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 141
LDI r2, 377
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
