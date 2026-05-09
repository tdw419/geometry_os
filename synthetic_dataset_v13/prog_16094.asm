; DESCRIPTION: Renders a orange box of size 10x77 starting at (90, 15).
; PLAN: r0=90(x), r1=15(y), r2=10(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 10
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
