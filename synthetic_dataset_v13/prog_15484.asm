; DESCRIPTION: Places a purple line segment connecting (332, 146) to (446, 19).
; PLAN: r0=332(x1), r1=146(y1), r2=446(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 146
LDI r2, 446
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
