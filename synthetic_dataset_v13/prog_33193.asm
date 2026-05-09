; DESCRIPTION: Renders a orange box of size 114x117 starting at (130, 12).
; PLAN: r0=130(x), r1=12(y), r2=114(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 12
LDI r2, 114
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
