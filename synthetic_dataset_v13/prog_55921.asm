; DESCRIPTION: Draws a blue line from (262, 221) to (233, 229).
; PLAN: r0=262(x1), r1=221(y1), r2=233(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 221
LDI r2, 233
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
