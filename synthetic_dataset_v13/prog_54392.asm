; DESCRIPTION: Draws a red circle centered at (302, 187) with radius 16.
; PLAN: r0=302(x), r1=187(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 187
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
