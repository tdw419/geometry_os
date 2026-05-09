; DESCRIPTION: Renders a orange box of size 58x45 starting at (204, 75).
; PLAN: r0=204(x), r1=75(y), r2=58(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 75
LDI r2, 58
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
