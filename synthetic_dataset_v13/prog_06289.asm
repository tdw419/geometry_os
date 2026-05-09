; DESCRIPTION: Places a cyan circle of radius 80 at center (113, 145).
; PLAN: r0=113(x), r1=145(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 145
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
