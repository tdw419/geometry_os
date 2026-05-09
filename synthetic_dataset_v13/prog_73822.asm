; DESCRIPTION: Draws a red circle centered at (231, 117) with radius 80.
; PLAN: r0=231(x), r1=117(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 117
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
