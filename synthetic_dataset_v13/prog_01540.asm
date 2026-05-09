; DESCRIPTION: Renders a orange box of size 96x62 starting at (382, 71).
; PLAN: r0=382(x), r1=71(y), r2=96(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 71
LDI r2, 96
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
