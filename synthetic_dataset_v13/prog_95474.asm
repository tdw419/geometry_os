; DESCRIPTION: Renders a orange box of size 54x49 starting at (302, 7).
; PLAN: r0=302(x), r1=7(y), r2=54(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 7
LDI r2, 54
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
