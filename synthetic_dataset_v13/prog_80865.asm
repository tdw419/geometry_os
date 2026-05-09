; DESCRIPTION: Places a cyan circle of radius 16 at center (144, 185).
; PLAN: r0=144(x), r1=185(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 185
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
