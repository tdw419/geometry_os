; DESCRIPTION: Renders a orange box of size 10x14 starting at (379, 30).
; PLAN: r0=379(x), r1=30(y), r2=10(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 30
LDI r2, 10
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
