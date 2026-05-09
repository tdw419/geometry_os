; DESCRIPTION: Renders a yellow line between points (368, 61) and (433, 180).
; PLAN: r0=368(x1), r1=61(y1), r2=433(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 61
LDI r2, 433
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
