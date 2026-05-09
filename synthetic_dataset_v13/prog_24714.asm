; DESCRIPTION: Places a magenta circle of radius 35 at center (295, 94).
; PLAN: r0=295(x), r1=94(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 94
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
