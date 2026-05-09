; DESCRIPTION: Renders a red box of size 69x23 starting at (370, 33).
; PLAN: r0=370(x), r1=33(y), r2=69(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 33
LDI r2, 69
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
