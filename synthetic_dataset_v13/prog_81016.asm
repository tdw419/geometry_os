; DESCRIPTION: Places a green line segment connecting (350, 222) to (503, 173).
; PLAN: r0=350(x1), r1=222(y1), r2=503(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 222
LDI r2, 503
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
