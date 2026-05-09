; DESCRIPTION: Renders a blue line between points (209, 44) and (403, 198).
; PLAN: r0=209(x1), r1=44(y1), r2=403(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 44
LDI r2, 403
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
