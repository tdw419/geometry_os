; DESCRIPTION: Renders a blue line between points (44, 154) and (124, 213).
; PLAN: r0=44(x1), r1=154(y1), r2=124(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 154
LDI r2, 124
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
