; DESCRIPTION: Renders a orange box of size 65x49 starting at (193, 49).
; PLAN: r0=193(x), r1=49(y), r2=65(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 49
LDI r2, 65
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
