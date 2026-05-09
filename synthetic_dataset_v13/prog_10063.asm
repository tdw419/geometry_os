; DESCRIPTION: Renders a blue line between points (352, 164) and (306, 23).
; PLAN: r0=352(x1), r1=164(y1), r2=306(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 164
LDI r2, 306
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
