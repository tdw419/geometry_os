; DESCRIPTION: Places a blue circle of radius 57 at center (268, 117).
; PLAN: r0=268(x), r1=117(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 117
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
