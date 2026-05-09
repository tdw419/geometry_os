; DESCRIPTION: Renders a orange box of size 31x22 starting at (293, 33).
; PLAN: r0=293(x), r1=33(y), r2=31(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 33
LDI r2, 31
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
