; DESCRIPTION: Places a yellow circle of radius 74 at center (192, 117).
; PLAN: r0=192(x), r1=117(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 117
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
