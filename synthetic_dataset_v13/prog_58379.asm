; DESCRIPTION: Draws a cyan circle centered at (300, 173) with radius 33.
; PLAN: r0=300(x), r1=173(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 173
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
