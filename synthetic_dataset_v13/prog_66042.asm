; DESCRIPTION: Renders a orange box of size 84x66 starting at (300, 29).
; PLAN: r0=300(x), r1=29(y), r2=84(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 29
LDI r2, 84
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
