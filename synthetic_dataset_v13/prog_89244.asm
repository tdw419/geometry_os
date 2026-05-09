; DESCRIPTION: Renders a yellow line between points (502, 177) and (414, 38).
; PLAN: r0=502(x1), r1=177(y1), r2=414(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 177
LDI r2, 414
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
