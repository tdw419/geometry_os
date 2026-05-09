; DESCRIPTION: Renders a red box of size 44x43 starting at (429, 165).
; PLAN: r0=429(x), r1=165(y), r2=44(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 165
LDI r2, 44
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
