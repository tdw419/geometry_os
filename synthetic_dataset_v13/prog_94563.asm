; DESCRIPTION: Renders a purple line between points (313, 6) and (502, 195).
; PLAN: r0=313(x1), r1=6(y1), r2=502(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 6
LDI r2, 502
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
