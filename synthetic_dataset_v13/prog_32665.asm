; DESCRIPTION: Renders a orange box of size 75x19 starting at (115, 185).
; PLAN: r0=115(x), r1=185(y), r2=75(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 185
LDI r2, 75
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
