; DESCRIPTION: Draws a blue line from (455, 21) to (401, 55).
; PLAN: r0=455(x1), r1=21(y1), r2=401(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 21
LDI r2, 401
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
