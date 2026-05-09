; DESCRIPTION: Renders a orange box of size 82x106 starting at (0, 20).
; PLAN: r0=0(x), r1=20(y), r2=82(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 20
LDI r2, 82
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
