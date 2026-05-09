; DESCRIPTION: Places a black line segment connecting (287, 173) to (411, 198).
; PLAN: r0=287(x1), r1=173(y1), r2=411(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 173
LDI r2, 411
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
