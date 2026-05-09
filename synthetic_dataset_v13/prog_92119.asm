; DESCRIPTION: Draws a white line from (226, 5) to (352, 234).
; PLAN: r0=226(x1), r1=5(y1), r2=352(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 5
LDI r2, 352
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
