; DESCRIPTION: Renders a orange box of size 46x18 starting at (141, 3).
; PLAN: r0=141(x), r1=3(y), r2=46(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 3
LDI r2, 46
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
