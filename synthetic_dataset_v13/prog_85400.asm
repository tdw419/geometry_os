; DESCRIPTION: Renders a orange box of size 37x34 starting at (350, 130).
; PLAN: r0=350(x), r1=130(y), r2=37(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 130
LDI r2, 37
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
