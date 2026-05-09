; DESCRIPTION: Draws a red line from (487, 12) to (323, 168).
; PLAN: r0=487(x1), r1=12(y1), r2=323(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 12
LDI r2, 323
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
