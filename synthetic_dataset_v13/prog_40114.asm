; DESCRIPTION: Places a white line segment connecting (395, 58) to (397, 235).
; PLAN: r0=395(x1), r1=58(y1), r2=397(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 58
LDI r2, 397
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
