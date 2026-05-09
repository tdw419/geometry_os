; DESCRIPTION: Draws a red line from (115, 124) to (407, 225).
; PLAN: r0=115(x1), r1=124(y1), r2=407(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 124
LDI r2, 407
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
