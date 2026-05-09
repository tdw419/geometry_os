; DESCRIPTION: Draws a white line from (287, 135) to (65, 214).
; PLAN: r0=287(x1), r1=135(y1), r2=65(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 135
LDI r2, 65
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
