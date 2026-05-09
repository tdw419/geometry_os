; DESCRIPTION: Draws a red line from (487, 229) to (120, 185).
; PLAN: r0=487(x1), r1=229(y1), r2=120(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 229
LDI r2, 120
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
