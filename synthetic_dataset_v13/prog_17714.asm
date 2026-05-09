; DESCRIPTION: Places a red line segment connecting (98, 132) to (271, 128).
; PLAN: r0=98(x1), r1=132(y1), r2=271(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 132
LDI r2, 271
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
