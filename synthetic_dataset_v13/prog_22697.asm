; DESCRIPTION: Renders a orange box of size 77x82 starting at (256, 15).
; PLAN: r0=256(x), r1=15(y), r2=77(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 15
LDI r2, 77
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
