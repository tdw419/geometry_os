; DESCRIPTION: Draws a cyan circle centered at (394, 134) with radius 70.
; PLAN: r0=394(x), r1=134(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 134
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
