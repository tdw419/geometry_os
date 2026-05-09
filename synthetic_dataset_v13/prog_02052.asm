; DESCRIPTION: Renders a orange box of size 29x87 starting at (91, 44).
; PLAN: r0=91(x), r1=44(y), r2=29(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 44
LDI r2, 29
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
