; DESCRIPTION: Renders a orange box of size 40x24 starting at (285, 191).
; PLAN: r0=285(x), r1=191(y), r2=40(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 191
LDI r2, 40
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
