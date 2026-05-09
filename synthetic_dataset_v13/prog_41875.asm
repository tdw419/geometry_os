; DESCRIPTION: Renders a blue line between points (221, 213) and (330, 154).
; PLAN: r0=221(x1), r1=213(y1), r2=330(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 213
LDI r2, 330
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
