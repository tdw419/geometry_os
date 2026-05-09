; DESCRIPTION: Renders a orange box of size 63x68 starting at (33, 63).
; PLAN: r0=33(x), r1=63(y), r2=63(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 63
LDI r2, 63
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
