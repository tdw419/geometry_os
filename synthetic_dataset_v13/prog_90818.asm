; DESCRIPTION: Renders a orange box of size 20x54 starting at (171, 99).
; PLAN: r0=171(x), r1=99(y), r2=20(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 99
LDI r2, 20
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
