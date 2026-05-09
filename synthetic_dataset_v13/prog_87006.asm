; DESCRIPTION: Renders a orange box of size 71x84 starting at (204, 14).
; PLAN: r0=204(x), r1=14(y), r2=71(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 14
LDI r2, 71
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
