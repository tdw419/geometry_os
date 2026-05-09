; DESCRIPTION: Draws a red line from (83, 126) to (303, 119).
; PLAN: r0=83(x1), r1=126(y1), r2=303(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 126
LDI r2, 303
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
