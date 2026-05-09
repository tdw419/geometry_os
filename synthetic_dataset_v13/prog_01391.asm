; DESCRIPTION: Renders a green line between points (330, 12) and (221, 105).
; PLAN: r0=330(x1), r1=12(y1), r2=221(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 12
LDI r2, 221
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
