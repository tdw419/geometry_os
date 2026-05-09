; DESCRIPTION: Draws a green line from (154, 131) to (484, 202).
; PLAN: r0=154(x1), r1=131(y1), r2=484(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 131
LDI r2, 484
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
