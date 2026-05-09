; DESCRIPTION: Renders a orange box of size 99x68 starting at (26, 50).
; PLAN: r0=26(x), r1=50(y), r2=99(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 50
LDI r2, 99
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
