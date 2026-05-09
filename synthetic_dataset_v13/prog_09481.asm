; DESCRIPTION: Renders a orange box of size 79x86 starting at (88, 6).
; PLAN: r0=88(x), r1=6(y), r2=79(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 6
LDI r2, 79
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
