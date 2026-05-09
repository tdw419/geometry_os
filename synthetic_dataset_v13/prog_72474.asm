; DESCRIPTION: Places a orange line segment connecting (328, 157) to (261, 107).
; PLAN: r0=328(x1), r1=157(y1), r2=261(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 157
LDI r2, 261
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
