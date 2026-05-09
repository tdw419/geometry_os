; DESCRIPTION: Places a green circle of radius 63 at center (446, 75).
; PLAN: r0=446(x), r1=75(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 75
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
