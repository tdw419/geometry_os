; DESCRIPTION: Renders a red box of size 113x54 starting at (199, 69).
; PLAN: r0=199(x), r1=69(y), r2=113(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 69
LDI r2, 113
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
