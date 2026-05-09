; DESCRIPTION: Draws a green line from (348, 211) to (68, 117).
; PLAN: r0=348(x1), r1=211(y1), r2=68(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 211
LDI r2, 68
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
