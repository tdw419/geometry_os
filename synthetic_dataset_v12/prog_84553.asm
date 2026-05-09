; DESCRIPTION: Draws a cyan circle centered at (367, 187) with radius 53.
; PLAN: r0=367(x), r1=187(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 187
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
