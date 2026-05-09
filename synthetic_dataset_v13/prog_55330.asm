; DESCRIPTION: Renders a blue line between points (190, 47) and (146, 186).
; PLAN: r0=190(x1), r1=47(y1), r2=146(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 47
LDI r2, 146
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
