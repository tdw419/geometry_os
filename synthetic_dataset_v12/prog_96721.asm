; DESCRIPTION: Renders a magenta line between points (385, 33) and (371, 50).
; PLAN: r0=385(x1), r1=33(y1), r2=371(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 33
LDI r2, 371
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
