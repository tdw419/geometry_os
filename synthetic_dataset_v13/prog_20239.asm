; DESCRIPTION: Places a black circle of radius 36 at center (242, 133).
; PLAN: r0=242(x), r1=133(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 133
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
