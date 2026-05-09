; DESCRIPTION: Places a cyan circle of radius 16 at center (204, 46).
; PLAN: r0=204(x), r1=46(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 46
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
