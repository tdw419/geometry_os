; DESCRIPTION: Renders a red line between points (258, 146) and (395, 249).
; PLAN: r0=258(x1), r1=146(y1), r2=395(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 146
LDI r2, 395
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
