; DESCRIPTION: Places a cyan circle of radius 45 at center (65, 54).
; PLAN: r0=65(x), r1=54(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 54
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
