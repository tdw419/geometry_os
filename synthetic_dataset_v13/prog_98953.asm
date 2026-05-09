; DESCRIPTION: Places a orange line segment connecting (307, 233) to (174, 60).
; PLAN: r0=307(x1), r1=233(y1), r2=174(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 233
LDI r2, 174
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
