; DESCRIPTION: Renders a orange box of size 28x75 starting at (225, 130).
; PLAN: r0=225(x), r1=130(y), r2=28(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 130
LDI r2, 28
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
