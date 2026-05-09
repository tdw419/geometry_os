; DESCRIPTION: Renders a orange box of size 48x93 starting at (459, 47).
; PLAN: r0=459(x), r1=47(y), r2=48(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 47
LDI r2, 48
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
