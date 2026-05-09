; DESCRIPTION: Renders a orange box of size 32x25 starting at (313, 10).
; PLAN: r0=313(x), r1=10(y), r2=32(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 10
LDI r2, 32
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
