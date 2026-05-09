; DESCRIPTION: Renders a red box of size 54x33 starting at (66, 69).
; PLAN: r0=66(x), r1=69(y), r2=54(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 69
LDI r2, 54
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
