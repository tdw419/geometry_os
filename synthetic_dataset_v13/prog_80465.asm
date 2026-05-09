; DESCRIPTION: Renders a green line between points (432, 59) and (131, 210).
; PLAN: r0=432(x1), r1=59(y1), r2=131(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 59
LDI r2, 131
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
