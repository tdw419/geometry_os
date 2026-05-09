; DESCRIPTION: Renders a orange box of size 85x64 starting at (37, 70).
; PLAN: r0=37(x), r1=70(y), r2=85(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 70
LDI r2, 85
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
