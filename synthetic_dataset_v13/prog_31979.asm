; DESCRIPTION: Places a green line segment connecting (151, 125) to (218, 242).
; PLAN: r0=151(x1), r1=125(y1), r2=218(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 125
LDI r2, 218
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
