; DESCRIPTION: Creates a purple circular shape at (438, 213) with radius 18.
; PLAN: r0=438(x), r1=213(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 213
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
