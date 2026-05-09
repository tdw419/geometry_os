; DESCRIPTION: Renders a orange box of size 97x80 starting at (163, 40).
; PLAN: r0=163(x), r1=40(y), r2=97(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 40
LDI r2, 97
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
