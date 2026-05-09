; DESCRIPTION: Places a cyan circle of radius 35 at center (50, 63).
; PLAN: r0=50(x), r1=63(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 63
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
