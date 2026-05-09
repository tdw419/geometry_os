; DESCRIPTION: Renders a green line between points (221, 29) and (174, 31).
; PLAN: r0=221(x1), r1=29(y1), r2=174(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 29
LDI r2, 174
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
