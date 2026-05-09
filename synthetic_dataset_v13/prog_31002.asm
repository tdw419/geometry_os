; DESCRIPTION: Places a green circle of radius 56 at center (74, 127).
; PLAN: r0=74(x), r1=127(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 127
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
