; DESCRIPTION: Places a yellow line segment connecting (370, 173) to (168, 76).
; PLAN: r0=370(x1), r1=173(y1), r2=168(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 173
LDI r2, 168
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
