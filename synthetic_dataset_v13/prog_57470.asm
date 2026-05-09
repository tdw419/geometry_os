; DESCRIPTION: Renders a orange box of size 63x85 starting at (435, 16).
; PLAN: r0=435(x), r1=16(y), r2=63(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 16
LDI r2, 63
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
