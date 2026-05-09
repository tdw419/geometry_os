; DESCRIPTION: Creates a yellow circular shape at (296, 186) with radius 51.
; PLAN: r0=296(x), r1=186(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 186
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
