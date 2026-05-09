; DESCRIPTION: Draws a cyan circle centered at (403, 234) with radius 17.
; PLAN: r0=403(x), r1=234(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 234
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
