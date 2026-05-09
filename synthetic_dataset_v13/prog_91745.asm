; DESCRIPTION: Places a red line segment connecting (362, 139) to (209, 59).
; PLAN: r0=362(x1), r1=139(y1), r2=209(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 139
LDI r2, 209
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
