; DESCRIPTION: Renders a orange box of size 84x109 starting at (23, 79).
; PLAN: r0=23(x), r1=79(y), r2=84(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 79
LDI r2, 84
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
