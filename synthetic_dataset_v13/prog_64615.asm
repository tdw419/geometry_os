; DESCRIPTION: Draws a blue line from (403, 226) to (425, 48).
; PLAN: r0=403(x1), r1=226(y1), r2=425(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 226
LDI r2, 425
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
