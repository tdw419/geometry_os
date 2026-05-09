; DESCRIPTION: Draws a cyan circle centered at (117, 180) with radius 64.
; PLAN: r0=117(x), r1=180(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 180
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
