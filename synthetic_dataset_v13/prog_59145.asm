; DESCRIPTION: Renders a orange box of size 75x53 starting at (213, 138).
; PLAN: r0=213(x), r1=138(y), r2=75(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 138
LDI r2, 75
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
