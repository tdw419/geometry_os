; DESCRIPTION: Renders a white box of size 69x19 starting at (218, 189).
; PLAN: r0=218(x), r1=189(y), r2=69(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 189
LDI r2, 69
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
