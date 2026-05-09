; DESCRIPTION: Draws a blue line from (48, 47) to (367, 96).
; PLAN: r0=48(x1), r1=47(y1), r2=367(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 47
LDI r2, 367
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
