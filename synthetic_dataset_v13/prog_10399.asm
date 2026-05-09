; DESCRIPTION: Places a magenta line segment connecting (406, 171) to (271, 98).
; PLAN: r0=406(x1), r1=171(y1), r2=271(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 171
LDI r2, 271
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
