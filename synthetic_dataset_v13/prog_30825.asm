; DESCRIPTION: Places a cyan circle of radius 54 at center (130, 133).
; PLAN: r0=130(x), r1=133(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 133
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
