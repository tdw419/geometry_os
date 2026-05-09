; DESCRIPTION: Renders a orange box of size 34x117 starting at (356, 93).
; PLAN: r0=356(x), r1=93(y), r2=34(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 93
LDI r2, 34
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
