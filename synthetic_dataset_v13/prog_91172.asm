; DESCRIPTION: Renders a blue line between points (0, 37) and (277, 107).
; PLAN: r0=0(x1), r1=37(y1), r2=277(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 37
LDI r2, 277
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
