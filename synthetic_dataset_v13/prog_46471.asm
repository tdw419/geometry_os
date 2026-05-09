; DESCRIPTION: Draws a red line from (120, 193) to (410, 168).
; PLAN: r0=120(x1), r1=193(y1), r2=410(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 193
LDI r2, 410
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
