; DESCRIPTION: Renders a orange box of size 77x108 starting at (73, 57).
; PLAN: r0=73(x), r1=57(y), r2=77(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 57
LDI r2, 77
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
