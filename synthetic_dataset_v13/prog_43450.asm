; DESCRIPTION: Places a green circle of radius 20 at center (446, 72).
; PLAN: r0=446(x), r1=72(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 72
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
