; DESCRIPTION: Renders a orange box of size 33x79 starting at (370, 148).
; PLAN: r0=370(x), r1=148(y), r2=33(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 148
LDI r2, 33
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
