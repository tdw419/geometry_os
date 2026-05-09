; DESCRIPTION: Places a yellow line segment connecting (117, 173) to (504, 69).
; PLAN: r0=117(x1), r1=173(y1), r2=504(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 173
LDI r2, 504
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
