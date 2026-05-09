; DESCRIPTION: Places a magenta line segment connecting (397, 138) to (285, 111).
; PLAN: r0=397(x1), r1=138(y1), r2=285(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 138
LDI r2, 285
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
