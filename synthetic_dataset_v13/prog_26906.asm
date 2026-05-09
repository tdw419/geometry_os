; DESCRIPTION: Renders a orange box of size 29x10 starting at (440, 184).
; PLAN: r0=440(x), r1=184(y), r2=29(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 184
LDI r2, 29
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
