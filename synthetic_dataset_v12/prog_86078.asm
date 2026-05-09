; DESCRIPTION: Renders a blue line between points (236, 73) and (234, 221).
; PLAN: r0=236(x1), r1=73(y1), r2=234(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 73
LDI r2, 234
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
