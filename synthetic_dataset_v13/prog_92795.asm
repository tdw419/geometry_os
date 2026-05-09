; DESCRIPTION: Places a black line segment connecting (344, 59) to (475, 173).
; PLAN: r0=344(x1), r1=59(y1), r2=475(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 59
LDI r2, 475
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
