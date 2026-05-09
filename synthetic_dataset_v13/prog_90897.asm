; DESCRIPTION: Places a green line segment connecting (232, 248) to (213, 173).
; PLAN: r0=232(x1), r1=248(y1), r2=213(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 248
LDI r2, 213
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
