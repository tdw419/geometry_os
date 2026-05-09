; DESCRIPTION: Renders a red line between points (367, 6) and (405, 149).
; PLAN: r0=367(x1), r1=6(y1), r2=405(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 6
LDI r2, 405
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
