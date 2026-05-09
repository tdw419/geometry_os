; DESCRIPTION: Renders a orange box of size 16x23 starting at (271, 99).
; PLAN: r0=271(x), r1=99(y), r2=16(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 99
LDI r2, 16
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
