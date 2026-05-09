; DESCRIPTION: Renders a orange box of size 105x11 starting at (42, 80).
; PLAN: r0=42(x), r1=80(y), r2=105(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 80
LDI r2, 105
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
