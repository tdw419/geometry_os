; DESCRIPTION: Places a green line segment connecting (397, 143) to (45, 208).
; PLAN: r0=397(x1), r1=143(y1), r2=45(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 143
LDI r2, 45
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
