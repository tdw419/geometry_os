; DESCRIPTION: Places a blue line segment connecting (319, 149) to (303, 171).
; PLAN: r0=319(x1), r1=149(y1), r2=303(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 149
LDI r2, 303
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
