; DESCRIPTION: Renders a green line between points (422, 179) and (82, 223).
; PLAN: r0=422(x1), r1=179(y1), r2=82(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 179
LDI r2, 82
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
