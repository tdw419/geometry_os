; DESCRIPTION: Creates a cyan circular shape at (296, 90) with radius 17.
; PLAN: r0=296(x), r1=90(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 90
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
