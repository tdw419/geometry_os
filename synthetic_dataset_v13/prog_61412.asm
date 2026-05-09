; DESCRIPTION: Draws a magenta line from (262, 188) to (296, 214).
; PLAN: r0=262(x1), r1=188(y1), r2=296(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 188
LDI r2, 296
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
