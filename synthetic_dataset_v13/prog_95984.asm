; DESCRIPTION: Draws a yellow line from (69, 168) to (20, 1).
; PLAN: r0=69(x1), r1=168(y1), r2=20(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 168
LDI r2, 20
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
