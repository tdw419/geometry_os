; DESCRIPTION: Renders a orange box of size 96x49 starting at (369, 144).
; PLAN: r0=369(x), r1=144(y), r2=96(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 144
LDI r2, 96
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
