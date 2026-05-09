; DESCRIPTION: Draws a yellow circle centered at (182, 68) with radius 46.
; PLAN: r0=182(x), r1=68(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 68
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
