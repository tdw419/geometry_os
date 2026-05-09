; DESCRIPTION: Places a black line segment connecting (237, 103) to (103, 209).
; PLAN: r0=237(x1), r1=103(y1), r2=103(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 103
LDI r2, 103
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
