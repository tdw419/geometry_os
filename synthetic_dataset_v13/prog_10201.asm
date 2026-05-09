; DESCRIPTION: Renders a orange box of size 102x72 starting at (370, 83).
; PLAN: r0=370(x), r1=83(y), r2=102(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 83
LDI r2, 102
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
