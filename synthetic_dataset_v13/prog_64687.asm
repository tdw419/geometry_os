; DESCRIPTION: Renders a red line between points (94, 111) and (146, 230).
; PLAN: r0=94(x1), r1=111(y1), r2=146(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 111
LDI r2, 146
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
