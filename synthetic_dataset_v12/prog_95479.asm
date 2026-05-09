; DESCRIPTION: Places a green line segment connecting (467, 113) to (397, 55).
; PLAN: r0=467(x1), r1=113(y1), r2=397(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 113
LDI r2, 397
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
