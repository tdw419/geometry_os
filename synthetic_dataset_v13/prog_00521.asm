; DESCRIPTION: Renders a red box of size 72x46 starting at (101, 33).
; PLAN: r0=101(x), r1=33(y), r2=72(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 33
LDI r2, 72
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
