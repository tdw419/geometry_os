; DESCRIPTION: Renders a orange box of size 72x110 starting at (394, 108).
; PLAN: r0=394(x), r1=108(y), r2=72(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 108
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
