; DESCRIPTION: Places a blue line segment connecting (132, 237) to (303, 27).
; PLAN: r0=132(x1), r1=237(y1), r2=303(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 237
LDI r2, 303
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
