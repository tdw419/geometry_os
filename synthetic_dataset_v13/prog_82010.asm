; DESCRIPTION: Draws a cyan circle centered at (94, 120) with radius 72.
; PLAN: r0=94(x), r1=120(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 120
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
