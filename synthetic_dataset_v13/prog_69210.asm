; DESCRIPTION: Renders a orange box of size 93x79 starting at (64, 148).
; PLAN: r0=64(x), r1=148(y), r2=93(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
