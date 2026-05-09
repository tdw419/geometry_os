; DESCRIPTION: Places a black line segment connecting (64, 208) to (277, 197).
; PLAN: r0=64(x1), r1=208(y1), r2=277(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 208
LDI r2, 277
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
