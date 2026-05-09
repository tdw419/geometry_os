; DESCRIPTION: Draws a purple line from (225, 29) to (238, 146).
; PLAN: r0=225(x1), r1=29(y1), r2=238(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 29
LDI r2, 238
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
