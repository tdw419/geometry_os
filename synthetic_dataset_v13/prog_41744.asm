; DESCRIPTION: Renders a orange box of size 18x38 starting at (435, 128).
; PLAN: r0=435(x), r1=128(y), r2=18(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 128
LDI r2, 18
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
