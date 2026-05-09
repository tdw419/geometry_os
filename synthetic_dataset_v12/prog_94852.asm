; DESCRIPTION: Renders a orange box of size 107x38 starting at (314, 40).
; PLAN: r0=314(x), r1=40(y), r2=107(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 40
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
