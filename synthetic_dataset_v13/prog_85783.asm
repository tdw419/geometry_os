; DESCRIPTION: Places a yellow line segment connecting (438, 173) to (340, 168).
; PLAN: r0=438(x1), r1=173(y1), r2=340(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 173
LDI r2, 340
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
