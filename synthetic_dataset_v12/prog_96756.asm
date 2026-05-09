; DESCRIPTION: Renders a purple line between points (361, 33) and (333, 202).
; PLAN: r0=361(x1), r1=33(y1), r2=333(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 33
LDI r2, 333
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
