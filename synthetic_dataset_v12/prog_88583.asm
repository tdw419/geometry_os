; DESCRIPTION: Places a cyan circle of radius 58 at center (326, 70).
; PLAN: r0=326(x), r1=70(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 70
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
