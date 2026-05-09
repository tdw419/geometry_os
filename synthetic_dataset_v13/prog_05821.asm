; DESCRIPTION: Creates a black circular shape at (386, 127) with radius 68.
; PLAN: r0=386(x), r1=127(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 127
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
