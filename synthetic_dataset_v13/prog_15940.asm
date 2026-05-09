; DESCRIPTION: Renders a orange box of size 21x40 starting at (185, 72).
; PLAN: r0=185(x), r1=72(y), r2=21(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 72
LDI r2, 21
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
