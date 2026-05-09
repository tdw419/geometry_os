; DESCRIPTION: Renders a yellow line between points (304, 34) and (429, 221).
; PLAN: r0=304(x1), r1=34(y1), r2=429(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 34
LDI r2, 429
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
