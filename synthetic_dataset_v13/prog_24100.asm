; DESCRIPTION: Renders a blue line between points (207, 64) and (167, 222).
; PLAN: r0=207(x1), r1=64(y1), r2=167(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 64
LDI r2, 167
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
