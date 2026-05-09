; DESCRIPTION: Draws a black circle centered at (443, 173) with radius 59.
; PLAN: r0=443(x), r1=173(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 173
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
