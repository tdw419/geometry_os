; DESCRIPTION: Creates a yellow circular shape at (288, 186) with radius 68.
; PLAN: r0=288(x), r1=186(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 186
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
