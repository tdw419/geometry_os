; DESCRIPTION: Draws a red line from (28, 243) to (108, 137).
; PLAN: r0=28(x1), r1=243(y1), r2=108(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 243
LDI r2, 108
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
