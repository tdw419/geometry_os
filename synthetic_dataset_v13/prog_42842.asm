; DESCRIPTION: Renders a orange box of size 70x86 starting at (369, 81).
; PLAN: r0=369(x), r1=81(y), r2=70(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 81
LDI r2, 70
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
