; DESCRIPTION: Draws a cyan circle centered at (182, 141) with radius 70.
; PLAN: r0=182(x), r1=141(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 141
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
