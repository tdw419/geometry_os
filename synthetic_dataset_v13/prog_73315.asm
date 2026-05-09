; DESCRIPTION: Draws a red line from (226, 124) to (470, 249).
; PLAN: r0=226(x1), r1=124(y1), r2=470(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 124
LDI r2, 470
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
