; DESCRIPTION: Draws a red line from (449, 243) to (475, 0).
; PLAN: r0=449(x1), r1=243(y1), r2=475(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 243
LDI r2, 475
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
