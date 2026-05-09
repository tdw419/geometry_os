; DESCRIPTION: Draws a green line from (396, 64) to (181, 177).
; PLAN: r0=396(x1), r1=64(y1), r2=181(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 64
LDI r2, 181
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
