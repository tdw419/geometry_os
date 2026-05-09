; DESCRIPTION: Renders a orange box of size 28x10 starting at (385, 54).
; PLAN: r0=385(x), r1=54(y), r2=28(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 54
LDI r2, 28
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
