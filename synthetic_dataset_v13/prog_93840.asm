; DESCRIPTION: Renders a orange box of size 21x73 starting at (86, 26).
; PLAN: r0=86(x), r1=26(y), r2=21(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 26
LDI r2, 21
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
