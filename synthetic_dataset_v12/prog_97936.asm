; DESCRIPTION: Renders a white box of size 111x103 starting at (397, 3).
; PLAN: r0=397(x), r1=3(y), r2=111(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 3
LDI r2, 111
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
