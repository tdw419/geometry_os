; DESCRIPTION: Renders a red line between points (510, 46) and (476, 160).
; PLAN: r0=510(x1), r1=46(y1), r2=476(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 46
LDI r2, 476
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
