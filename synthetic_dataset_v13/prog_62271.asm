; DESCRIPTION: Renders a orange box of size 66x46 starting at (313, 79).
; PLAN: r0=313(x), r1=79(y), r2=66(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 79
LDI r2, 66
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
