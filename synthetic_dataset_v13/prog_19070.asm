; DESCRIPTION: Renders a red box of size 71x43 starting at (400, 149).
; PLAN: r0=400(x), r1=149(y), r2=71(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 149
LDI r2, 71
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
