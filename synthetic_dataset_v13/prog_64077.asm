; DESCRIPTION: Renders a orange box of size 66x10 starting at (61, 173).
; PLAN: r0=61(x), r1=173(y), r2=66(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 173
LDI r2, 66
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
