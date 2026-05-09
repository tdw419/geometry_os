; DESCRIPTION: Draws a blue line from (96, 137) to (146, 139).
; PLAN: r0=96(x1), r1=137(y1), r2=146(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 137
LDI r2, 146
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
