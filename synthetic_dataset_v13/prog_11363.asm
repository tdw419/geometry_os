; DESCRIPTION: Renders a orange box of size 99x41 starting at (321, 150).
; PLAN: r0=321(x), r1=150(y), r2=99(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 150
LDI r2, 99
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
