; DESCRIPTION: Renders a yellow line between points (193, 66) and (415, 225).
; PLAN: r0=193(x1), r1=66(y1), r2=415(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 66
LDI r2, 415
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
