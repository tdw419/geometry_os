; DESCRIPTION: Renders a orange box of size 119x33 starting at (152, 7).
; PLAN: r0=152(x), r1=7(y), r2=119(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 7
LDI r2, 119
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
