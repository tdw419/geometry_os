; DESCRIPTION: Places a cyan circle of radius 71 at center (242, 83).
; PLAN: r0=242(x), r1=83(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 83
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
