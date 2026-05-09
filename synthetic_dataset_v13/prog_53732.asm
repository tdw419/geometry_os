; DESCRIPTION: Renders a orange box of size 21x100 starting at (402, 61).
; PLAN: r0=402(x), r1=61(y), r2=21(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 61
LDI r2, 21
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
