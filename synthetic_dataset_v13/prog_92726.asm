; DESCRIPTION: Renders a red box of size 54x34 starting at (174, 194).
; PLAN: r0=174(x), r1=194(y), r2=54(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 194
LDI r2, 54
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
