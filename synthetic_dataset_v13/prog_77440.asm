; DESCRIPTION: Places a blue line segment connecting (295, 39) to (0, 230).
; PLAN: r0=295(x1), r1=39(y1), r2=0(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 0
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
