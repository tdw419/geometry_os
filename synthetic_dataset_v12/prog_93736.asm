; DESCRIPTION: Renders a orange box of size 11x60 starting at (389, 8).
; PLAN: r0=389(x), r1=8(y), r2=11(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 8
LDI r2, 11
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
