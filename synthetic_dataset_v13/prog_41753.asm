; DESCRIPTION: Renders a red box of size 24x57 starting at (457, 18).
; PLAN: r0=457(x), r1=18(y), r2=24(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 18
LDI r2, 24
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
