; DESCRIPTION: Renders a orange box of size 10x78 starting at (45, 173).
; PLAN: r0=45(x), r1=173(y), r2=10(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 173
LDI r2, 10
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
