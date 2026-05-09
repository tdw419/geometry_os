; DESCRIPTION: Renders a orange box of size 84x33 starting at (224, 10).
; PLAN: r0=224(x), r1=10(y), r2=84(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 10
LDI r2, 84
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
