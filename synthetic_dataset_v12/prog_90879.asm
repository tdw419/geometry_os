; DESCRIPTION: Renders a orange box of size 42x89 starting at (181, 12).
; PLAN: r0=181(x), r1=12(y), r2=42(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 12
LDI r2, 42
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
