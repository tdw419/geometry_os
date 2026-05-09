; DESCRIPTION: Places a cyan circle of radius 24 at center (242, 71).
; PLAN: r0=242(x), r1=71(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 71
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
