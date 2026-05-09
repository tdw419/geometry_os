; DESCRIPTION: Renders a orange box of size 71x95 starting at (302, 0).
; PLAN: r0=302(x), r1=0(y), r2=71(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 0
LDI r2, 71
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
