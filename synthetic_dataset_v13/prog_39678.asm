; DESCRIPTION: Draws a red line from (195, 214) to (406, 184).
; PLAN: r0=195(x1), r1=214(y1), r2=406(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 214
LDI r2, 406
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
