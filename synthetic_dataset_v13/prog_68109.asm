; DESCRIPTION: Renders a orange box of size 99x87 starting at (246, 8).
; PLAN: r0=246(x), r1=8(y), r2=99(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 8
LDI r2, 99
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
