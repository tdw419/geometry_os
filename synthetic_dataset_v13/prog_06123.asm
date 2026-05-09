; DESCRIPTION: Places a cyan circle of radius 80 at center (193, 110).
; PLAN: r0=193(x), r1=110(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 110
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
