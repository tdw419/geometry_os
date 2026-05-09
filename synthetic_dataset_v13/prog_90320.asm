; DESCRIPTION: Places a cyan circle of radius 48 at center (445, 80).
; PLAN: r0=445(x), r1=80(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 80
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
