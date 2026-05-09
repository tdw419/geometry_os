; DESCRIPTION: Places a yellow line segment connecting (165, 64) to (264, 103).
; PLAN: r0=165(x1), r1=64(y1), r2=264(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 64
LDI r2, 264
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
