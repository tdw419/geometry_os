; DESCRIPTION: Places a black line segment connecting (307, 140) to (209, 38).
; PLAN: r0=307(x1), r1=140(y1), r2=209(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 140
LDI r2, 209
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
