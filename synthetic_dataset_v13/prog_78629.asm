; DESCRIPTION: Places a green line segment connecting (391, 0) to (173, 226).
; PLAN: r0=391(x1), r1=0(y1), r2=173(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 0
LDI r2, 173
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
