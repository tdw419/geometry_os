; DESCRIPTION: Renders a green line between points (361, 57) and (153, 202).
; PLAN: r0=361(x1), r1=57(y1), r2=153(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 57
LDI r2, 153
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
