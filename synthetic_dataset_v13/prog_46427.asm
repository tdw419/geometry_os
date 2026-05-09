; DESCRIPTION: Renders a white box of size 50x111 starting at (459, 69).
; PLAN: r0=459(x), r1=69(y), r2=50(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 69
LDI r2, 50
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
