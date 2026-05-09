; DESCRIPTION: Renders a orange box of size 96x92 starting at (96, 47).
; PLAN: r0=96(x), r1=47(y), r2=96(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 47
LDI r2, 96
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
