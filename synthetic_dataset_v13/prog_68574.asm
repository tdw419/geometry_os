; DESCRIPTION: Renders a green line between points (2, 8) and (352, 92).
; PLAN: r0=2(x1), r1=8(y1), r2=352(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 8
LDI r2, 352
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
