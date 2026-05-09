; DESCRIPTION: Renders a orange box of size 61x77 starting at (72, 119).
; PLAN: r0=72(x), r1=119(y), r2=61(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 119
LDI r2, 61
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
