; DESCRIPTION: Places a green circle of radius 13 at center (127, 223).
; PLAN: r0=127(x), r1=223(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 223
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
