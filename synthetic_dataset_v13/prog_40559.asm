; DESCRIPTION: Draws a blue line from (322, 150) to (295, 81).
; PLAN: r0=322(x1), r1=150(y1), r2=295(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 150
LDI r2, 295
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
