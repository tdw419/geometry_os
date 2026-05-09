; DESCRIPTION: Renders a orange box of size 22x15 starting at (152, 74).
; PLAN: r0=152(x), r1=74(y), r2=22(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 74
LDI r2, 22
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
