; DESCRIPTION: Renders a red line between points (400, 34) and (146, 243).
; PLAN: r0=400(x1), r1=34(y1), r2=146(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 34
LDI r2, 146
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
