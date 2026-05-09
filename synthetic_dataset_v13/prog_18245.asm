; DESCRIPTION: Renders a green line between points (305, 132) and (220, 47).
; PLAN: r0=305(x1), r1=132(y1), r2=220(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 132
LDI r2, 220
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
