; DESCRIPTION: Renders a red box of size 61x50 starting at (329, 69).
; PLAN: r0=329(x), r1=69(y), r2=61(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 69
LDI r2, 61
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
