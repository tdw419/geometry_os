; DESCRIPTION: Renders a orange box of size 22x86 starting at (40, 100).
; PLAN: r0=40(x), r1=100(y), r2=22(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 100
LDI r2, 22
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
