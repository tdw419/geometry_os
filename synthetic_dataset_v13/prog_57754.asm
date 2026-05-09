; DESCRIPTION: Places a yellow circle of radius 20 at center (492, 166).
; PLAN: r0=492(x), r1=166(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 492
LDI r1, 166
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
