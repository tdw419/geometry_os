; DESCRIPTION: Draws a yellow circle centered at (146, 97) with radius 76.
; PLAN: r0=146(x), r1=97(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 97
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
