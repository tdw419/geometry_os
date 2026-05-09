; DESCRIPTION: Draws a red line from (412, 59) to (69, 216).
; PLAN: r0=412(x1), r1=59(y1), r2=69(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 59
LDI r2, 69
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
