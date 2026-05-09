; DESCRIPTION: Renders a red line between points (59, 193) and (198, 167).
; PLAN: r0=59(x1), r1=193(y1), r2=198(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 193
LDI r2, 198
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
