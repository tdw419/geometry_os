; DESCRIPTION: Draws a cyan line from (314, 124) to (214, 179).
; PLAN: r0=314(x1), r1=124(y1), r2=214(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 124
LDI r2, 214
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
