; DESCRIPTION: Draws a white line from (188, 238) to (387, 167).
; PLAN: r0=188(x1), r1=238(y1), r2=387(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 238
LDI r2, 387
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
