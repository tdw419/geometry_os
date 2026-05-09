; DESCRIPTION: Places a green line segment connecting (222, 111) to (286, 113).
; PLAN: r0=222(x1), r1=111(y1), r2=286(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 111
LDI r2, 286
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
