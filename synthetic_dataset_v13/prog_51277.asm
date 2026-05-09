; DESCRIPTION: Renders a orange box of size 105x21 starting at (403, 106).
; PLAN: r0=403(x), r1=106(y), r2=105(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 106
LDI r2, 105
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
