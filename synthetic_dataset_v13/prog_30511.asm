; DESCRIPTION: Renders a orange box of size 42x113 starting at (431, 93).
; PLAN: r0=431(x), r1=93(y), r2=42(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 93
LDI r2, 42
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
