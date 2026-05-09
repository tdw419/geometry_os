; DESCRIPTION: Renders a orange box of size 60x11 starting at (419, 194).
; PLAN: r0=419(x), r1=194(y), r2=60(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 194
LDI r2, 60
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
