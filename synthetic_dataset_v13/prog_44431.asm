; DESCRIPTION: Renders a orange box of size 116x16 starting at (212, 196).
; PLAN: r0=212(x), r1=196(y), r2=116(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 196
LDI r2, 116
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
