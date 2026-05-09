; DESCRIPTION: Renders a orange box of size 42x43 starting at (275, 68).
; PLAN: r0=275(x), r1=68(y), r2=42(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 68
LDI r2, 42
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
