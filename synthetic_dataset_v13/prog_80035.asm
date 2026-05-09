; DESCRIPTION: Renders a orange box of size 46x45 starting at (138, 126).
; PLAN: r0=138(x), r1=126(y), r2=46(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 126
LDI r2, 46
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
