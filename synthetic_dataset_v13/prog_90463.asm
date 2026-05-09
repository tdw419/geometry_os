; DESCRIPTION: Renders a orange box of size 120x101 starting at (300, 127).
; PLAN: r0=300(x), r1=127(y), r2=120(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 127
LDI r2, 120
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
