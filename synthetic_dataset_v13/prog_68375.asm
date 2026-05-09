; DESCRIPTION: Renders a orange box of size 28x89 starting at (124, 44).
; PLAN: r0=124(x), r1=44(y), r2=28(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 44
LDI r2, 28
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
