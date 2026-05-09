; DESCRIPTION: Draws a red line from (465, 18) to (421, 216).
; PLAN: r0=465(x1), r1=18(y1), r2=421(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 18
LDI r2, 421
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
