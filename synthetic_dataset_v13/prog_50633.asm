; DESCRIPTION: Draws a blue line from (403, 6) to (152, 124).
; PLAN: r0=403(x1), r1=6(y1), r2=152(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 6
LDI r2, 152
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
