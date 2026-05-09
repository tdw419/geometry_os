; DESCRIPTION: Renders a orange box of size 43x29 starting at (415, 130).
; PLAN: r0=415(x), r1=130(y), r2=43(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 130
LDI r2, 43
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
