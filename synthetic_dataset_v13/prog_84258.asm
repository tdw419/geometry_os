; DESCRIPTION: Draws a red line from (405, 120) to (449, 250).
; PLAN: r0=405(x1), r1=120(y1), r2=449(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 120
LDI r2, 449
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
