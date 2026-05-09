; DESCRIPTION: Places a cyan circle of radius 65 at center (68, 112).
; PLAN: r0=68(x), r1=112(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 112
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
