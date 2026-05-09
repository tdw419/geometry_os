; DESCRIPTION: Places a green circle of radius 63 at center (146, 122).
; PLAN: r0=146(x), r1=122(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 122
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
