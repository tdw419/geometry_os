; DESCRIPTION: Draws a cyan circle centered at (445, 69) with radius 43.
; PLAN: r0=445(x), r1=69(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 69
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
