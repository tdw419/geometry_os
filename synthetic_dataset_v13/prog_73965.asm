; DESCRIPTION: Renders a orange box of size 60x76 starting at (241, 89).
; PLAN: r0=241(x), r1=89(y), r2=60(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 89
LDI r2, 60
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
