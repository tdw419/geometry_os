; DESCRIPTION: Draws a red line from (218, 95) to (159, 164).
; PLAN: r0=218(x1), r1=95(y1), r2=159(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 95
LDI r2, 159
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
