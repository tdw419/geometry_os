; DESCRIPTION: Renders a red line between points (230, 77) and (392, 19).
; PLAN: r0=230(x1), r1=77(y1), r2=392(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 77
LDI r2, 392
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
