; DESCRIPTION: Places a red line segment connecting (412, 214) to (481, 139).
; PLAN: r0=412(x1), r1=214(y1), r2=481(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 214
LDI r2, 481
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
