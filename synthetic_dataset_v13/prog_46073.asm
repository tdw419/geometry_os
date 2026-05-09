; DESCRIPTION: Draws a red line from (487, 243) to (423, 126).
; PLAN: r0=487(x1), r1=243(y1), r2=423(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 243
LDI r2, 423
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
