; DESCRIPTION: Places a yellow circle of radius 38 at center (364, 167).
; PLAN: r0=364(x), r1=167(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 167
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
