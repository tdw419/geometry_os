; DESCRIPTION: Renders a orange box of size 117x54 starting at (62, 57).
; PLAN: r0=62(x), r1=57(y), r2=117(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 57
LDI r2, 117
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
