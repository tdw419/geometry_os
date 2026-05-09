; DESCRIPTION: Places a green circle of radius 57 at center (220, 161).
; PLAN: r0=220(x), r1=161(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 161
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
