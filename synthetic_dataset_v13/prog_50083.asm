; DESCRIPTION: Renders a green line between points (305, 61) and (372, 66).
; PLAN: r0=305(x1), r1=61(y1), r2=372(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 61
LDI r2, 372
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
