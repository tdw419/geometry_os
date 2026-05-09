; DESCRIPTION: Places a yellow line segment connecting (128, 229) to (387, 135).
; PLAN: r0=128(x1), r1=229(y1), r2=387(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 229
LDI r2, 387
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
