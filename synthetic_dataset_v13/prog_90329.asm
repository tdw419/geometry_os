; DESCRIPTION: Renders a orange box of size 42x59 starting at (265, 156).
; PLAN: r0=265(x), r1=156(y), r2=42(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 156
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
