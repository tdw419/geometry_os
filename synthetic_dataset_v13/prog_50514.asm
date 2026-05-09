; DESCRIPTION: Renders a orange box of size 98x77 starting at (148, 73).
; PLAN: r0=148(x), r1=73(y), r2=98(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 73
LDI r2, 98
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
