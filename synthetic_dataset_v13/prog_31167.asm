; DESCRIPTION: Renders a orange box of size 82x54 starting at (324, 185).
; PLAN: r0=324(x), r1=185(y), r2=82(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 185
LDI r2, 82
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
