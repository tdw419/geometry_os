; DESCRIPTION: Draws a blue line from (407, 228) to (84, 82).
; PLAN: r0=407(x1), r1=228(y1), r2=84(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 228
LDI r2, 84
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
