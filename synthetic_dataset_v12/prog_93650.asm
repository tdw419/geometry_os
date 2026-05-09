; DESCRIPTION: Renders a orange box of size 119x89 starting at (218, 92).
; PLAN: r0=218(x), r1=92(y), r2=119(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 92
LDI r2, 119
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
