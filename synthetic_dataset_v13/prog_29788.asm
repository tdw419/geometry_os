; DESCRIPTION: Draws a green line from (414, 202) to (219, 214).
; PLAN: r0=414(x1), r1=202(y1), r2=219(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 202
LDI r2, 219
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
