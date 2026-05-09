; DESCRIPTION: Renders a orange box of size 116x109 starting at (280, 54).
; PLAN: r0=280(x), r1=54(y), r2=116(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 54
LDI r2, 116
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
