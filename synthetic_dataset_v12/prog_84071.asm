; DESCRIPTION: Draws a red circle centered at (406, 197) with radius 32.
; PLAN: r0=406(x), r1=197(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 197
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
