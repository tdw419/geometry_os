; DESCRIPTION: Places a yellow circle of radius 79 at center (281, 105).
; PLAN: r0=281(x), r1=105(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 105
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
