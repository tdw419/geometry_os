; DESCRIPTION: Places a blue line segment connecting (275, 157) to (173, 16).
; PLAN: r0=275(x1), r1=157(y1), r2=173(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 157
LDI r2, 173
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
