; DESCRIPTION: Places a cyan circle of radius 50 at center (462, 52).
; PLAN: r0=462(x), r1=52(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 52
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
