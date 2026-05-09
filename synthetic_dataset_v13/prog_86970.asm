; DESCRIPTION: Renders a white box of size 46x14 starting at (289, 199).
; PLAN: r0=289(x), r1=199(y), r2=46(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 199
LDI r2, 46
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
