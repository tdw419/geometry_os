; DESCRIPTION: Renders a orange box of size 82x68 starting at (170, 45).
; PLAN: r0=170(x), r1=45(y), r2=82(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 45
LDI r2, 82
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
