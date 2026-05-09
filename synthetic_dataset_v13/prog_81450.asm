; DESCRIPTION: Renders a orange box of size 32x60 starting at (127, 194).
; PLAN: r0=127(x), r1=194(y), r2=32(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 194
LDI r2, 32
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
