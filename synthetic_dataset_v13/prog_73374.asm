; DESCRIPTION: Renders a orange box of size 73x13 starting at (57, 145).
; PLAN: r0=57(x), r1=145(y), r2=73(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 145
LDI r2, 73
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
