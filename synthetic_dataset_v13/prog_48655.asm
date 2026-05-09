; DESCRIPTION: Places a black line segment connecting (255, 208) to (161, 195).
; PLAN: r0=255(x1), r1=208(y1), r2=161(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 208
LDI r2, 161
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
