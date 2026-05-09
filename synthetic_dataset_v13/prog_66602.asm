; DESCRIPTION: Places a orange line segment connecting (333, 32) to (48, 95).
; PLAN: r0=333(x1), r1=32(y1), r2=48(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 32
LDI r2, 48
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
