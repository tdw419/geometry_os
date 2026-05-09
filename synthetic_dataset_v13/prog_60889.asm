; DESCRIPTION: Draws a blue line from (389, 175) to (228, 76).
; PLAN: r0=389(x1), r1=175(y1), r2=228(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 175
LDI r2, 228
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
