; DESCRIPTION: Draws a blue line from (437, 154) to (202, 94).
; PLAN: r0=437(x1), r1=154(y1), r2=202(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 154
LDI r2, 202
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
