; DESCRIPTION: Places a green line segment connecting (374, 151) to (173, 168).
; PLAN: r0=374(x1), r1=151(y1), r2=173(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 151
LDI r2, 173
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
