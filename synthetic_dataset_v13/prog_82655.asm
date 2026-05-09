; DESCRIPTION: Renders a orange box of size 84x120 starting at (115, 120).
; PLAN: r0=115(x), r1=120(y), r2=84(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 120
LDI r2, 84
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
