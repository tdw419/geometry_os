; DESCRIPTION: Renders a white box of size 94x73 starting at (254, 39).
; PLAN: r0=254(x), r1=39(y), r2=94(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 39
LDI r2, 94
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
