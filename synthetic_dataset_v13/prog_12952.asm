; DESCRIPTION: Renders a orange box of size 113x38 starting at (189, 178).
; PLAN: r0=189(x), r1=178(y), r2=113(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 178
LDI r2, 113
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
