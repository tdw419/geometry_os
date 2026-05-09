; DESCRIPTION: Draws a red line from (303, 82) to (308, 237).
; PLAN: r0=303(x1), r1=82(y1), r2=308(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 82
LDI r2, 308
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
