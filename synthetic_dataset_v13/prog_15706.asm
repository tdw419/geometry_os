; DESCRIPTION: Renders a orange box of size 55x47 starting at (318, 79).
; PLAN: r0=318(x), r1=79(y), r2=55(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 79
LDI r2, 55
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
