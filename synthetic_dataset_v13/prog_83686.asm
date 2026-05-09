; DESCRIPTION: Places a yellow line segment connecting (360, 128) to (464, 7).
; PLAN: r0=360(x1), r1=128(y1), r2=464(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 128
LDI r2, 464
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
