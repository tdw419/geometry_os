; DESCRIPTION: Renders a blue line between points (476, 167) and (394, 210).
; PLAN: r0=476(x1), r1=167(y1), r2=394(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 167
LDI r2, 394
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
