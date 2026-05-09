; DESCRIPTION: Places a yellow circle of radius 47 at center (205, 186).
; PLAN: r0=205(x), r1=186(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 186
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
