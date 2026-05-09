; DESCRIPTION: Renders a yellow line between points (168, 30) and (433, 223).
; PLAN: r0=168(x1), r1=30(y1), r2=433(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 30
LDI r2, 433
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
