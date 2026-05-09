; DESCRIPTION: Renders a yellow line between points (220, 120) and (305, 248).
; PLAN: r0=220(x1), r1=120(y1), r2=305(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 120
LDI r2, 305
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
