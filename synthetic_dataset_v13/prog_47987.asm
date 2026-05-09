; DESCRIPTION: Renders a green box of size 69x47 starting at (397, 20).
; PLAN: r0=397(x), r1=20(y), r2=69(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 20
LDI r2, 69
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
