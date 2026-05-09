; DESCRIPTION: Renders a orange box of size 103x13 starting at (100, 237).
; PLAN: r0=100(x), r1=237(y), r2=103(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 237
LDI r2, 103
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
