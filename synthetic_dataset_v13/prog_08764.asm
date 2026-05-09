; DESCRIPTION: Renders a blue line between points (154, 91) and (330, 221).
; PLAN: r0=154(x1), r1=91(y1), r2=330(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 91
LDI r2, 330
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
