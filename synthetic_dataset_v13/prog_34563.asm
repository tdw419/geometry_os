; DESCRIPTION: Renders a orange box of size 102x71 starting at (234, 131).
; PLAN: r0=234(x), r1=131(y), r2=102(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 131
LDI r2, 102
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
