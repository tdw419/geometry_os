; DESCRIPTION: Draws a yellow circle centered at (410, 160) with radius 33.
; PLAN: r0=410(x), r1=160(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 160
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
