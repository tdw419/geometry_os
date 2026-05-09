; DESCRIPTION: Draws a cyan circle centered at (207, 118) with radius 30.
; PLAN: r0=207(x), r1=118(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 118
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
