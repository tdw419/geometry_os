; DESCRIPTION: Draws a red line from (405, 180) to (130, 193).
; PLAN: r0=405(x1), r1=180(y1), r2=130(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 180
LDI r2, 130
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
