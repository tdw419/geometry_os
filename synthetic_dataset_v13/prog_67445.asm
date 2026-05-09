; DESCRIPTION: Renders a orange box of size 20x99 starting at (125, 98).
; PLAN: r0=125(x), r1=98(y), r2=20(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 98
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
