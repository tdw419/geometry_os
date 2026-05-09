; DESCRIPTION: Renders a red line between points (297, 62) and (243, 221).
; PLAN: r0=297(x1), r1=62(y1), r2=243(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 62
LDI r2, 243
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
