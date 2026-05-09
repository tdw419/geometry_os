; DESCRIPTION: Renders a red line between points (164, 47) and (370, 167).
; PLAN: r0=164(x1), r1=47(y1), r2=370(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 47
LDI r2, 370
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
