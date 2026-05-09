; DESCRIPTION: Draws a green line from (101, 113) to (174, 214).
; PLAN: r0=101(x1), r1=113(y1), r2=174(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 113
LDI r2, 174
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
