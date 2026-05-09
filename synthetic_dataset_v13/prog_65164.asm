; DESCRIPTION: Places a white line segment connecting (434, 178) to (397, 156).
; PLAN: r0=434(x1), r1=178(y1), r2=397(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 178
LDI r2, 397
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
