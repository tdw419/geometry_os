; DESCRIPTION: Renders a orange box of size 101x104 starting at (36, 71).
; PLAN: r0=36(x), r1=71(y), r2=101(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 71
LDI r2, 101
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
