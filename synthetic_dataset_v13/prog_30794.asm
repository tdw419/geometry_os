; DESCRIPTION: Renders a orange box of size 31x18 starting at (402, 30).
; PLAN: r0=402(x), r1=30(y), r2=31(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 30
LDI r2, 31
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
