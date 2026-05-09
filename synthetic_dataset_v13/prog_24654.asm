; DESCRIPTION: Renders a orange box of size 39x83 starting at (204, 96).
; PLAN: r0=204(x), r1=96(y), r2=39(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 96
LDI r2, 39
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
