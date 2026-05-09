; DESCRIPTION: Places a orange line segment connecting (358, 242) to (503, 132).
; PLAN: r0=358(x1), r1=242(y1), r2=503(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 242
LDI r2, 503
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
