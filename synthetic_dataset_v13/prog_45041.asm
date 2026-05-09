; DESCRIPTION: Renders a orange box of size 75x23 starting at (302, 223).
; PLAN: r0=302(x), r1=223(y), r2=75(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 223
LDI r2, 75
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
