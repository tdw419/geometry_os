; DESCRIPTION: Draws a red line from (466, 254) to (409, 173).
; PLAN: r0=466(x1), r1=254(y1), r2=409(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 254
LDI r2, 409
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
