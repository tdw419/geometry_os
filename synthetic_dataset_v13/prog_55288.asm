; DESCRIPTION: Renders a orange box of size 12x119 starting at (404, 72).
; PLAN: r0=404(x), r1=72(y), r2=12(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 72
LDI r2, 12
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
