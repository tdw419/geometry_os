; DESCRIPTION: Renders a red box of size 69x85 starting at (197, 23).
; PLAN: r0=197(x), r1=23(y), r2=69(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 23
LDI r2, 69
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
