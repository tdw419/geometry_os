; DESCRIPTION: Draws a red circle centered at (281, 150) with radius 66.
; PLAN: r0=281(x), r1=150(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 150
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
