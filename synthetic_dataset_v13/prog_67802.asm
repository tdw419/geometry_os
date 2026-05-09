; DESCRIPTION: Creates a yellow circular shape at (264, 133) with radius 27.
; PLAN: r0=264(x), r1=133(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 133
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
