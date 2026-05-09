; DESCRIPTION: Creates a yellow circular shape at (328, 95) with radius 36.
; PLAN: r0=328(x), r1=95(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 95
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
