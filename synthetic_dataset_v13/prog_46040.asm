; DESCRIPTION: Draws a red line from (206, 124) to (157, 216).
; PLAN: r0=206(x1), r1=124(y1), r2=157(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 124
LDI r2, 157
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
