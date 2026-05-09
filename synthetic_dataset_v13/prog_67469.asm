; DESCRIPTION: Renders a red box of size 55x34 starting at (111, 54).
; PLAN: r0=111(x), r1=54(y), r2=55(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 54
LDI r2, 55
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
