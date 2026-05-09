; DESCRIPTION: Draws a red circle centered at (243, 40) with radius 13.
; PLAN: r0=243(x), r1=40(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 40
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
