; DESCRIPTION: Draws a red line from (195, 77) to (409, 117).
; PLAN: r0=195(x1), r1=77(y1), r2=409(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 77
LDI r2, 409
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
