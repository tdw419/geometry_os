; DESCRIPTION: Renders a orange box of size 47x63 starting at (331, 29).
; PLAN: r0=331(x), r1=29(y), r2=47(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 29
LDI r2, 47
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
