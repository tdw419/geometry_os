; DESCRIPTION: Places a yellow line segment connecting (368, 243) to (362, 139).
; PLAN: r0=368(x1), r1=243(y1), r2=362(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 243
LDI r2, 362
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
