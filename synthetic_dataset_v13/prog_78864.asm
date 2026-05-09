; DESCRIPTION: Draws a magenta line from (327, 84) to (193, 225).
; PLAN: r0=327(x1), r1=84(y1), r2=193(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 84
LDI r2, 193
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
