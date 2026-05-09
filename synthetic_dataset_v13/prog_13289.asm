; DESCRIPTION: Places a cyan circle of radius 43 at center (220, 87).
; PLAN: r0=220(x), r1=87(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 87
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
