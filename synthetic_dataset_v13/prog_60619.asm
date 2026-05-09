; DESCRIPTION: Draws a magenta line from (208, 153) to (480, 238).
; PLAN: r0=208(x1), r1=153(y1), r2=480(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 153
LDI r2, 480
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
