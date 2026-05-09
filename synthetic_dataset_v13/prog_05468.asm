; DESCRIPTION: Draws a white line from (221, 214) to (179, 162).
; PLAN: r0=221(x1), r1=214(y1), r2=179(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 214
LDI r2, 179
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
