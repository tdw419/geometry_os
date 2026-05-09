; DESCRIPTION: Draws a blue line from (117, 47) to (473, 142).
; PLAN: r0=117(x1), r1=47(y1), r2=473(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 47
LDI r2, 473
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
