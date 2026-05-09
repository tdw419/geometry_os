; DESCRIPTION: Draws a magenta line from (503, 16) to (446, 225).
; PLAN: r0=503(x1), r1=16(y1), r2=446(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 16
LDI r2, 446
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
