; DESCRIPTION: Places a green line segment connecting (93, 244) to (319, 113).
; PLAN: r0=93(x1), r1=244(y1), r2=319(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 244
LDI r2, 319
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
