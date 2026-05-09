; DESCRIPTION: Renders a orange box of size 18x119 starting at (297, 134).
; PLAN: r0=297(x), r1=134(y), r2=18(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 134
LDI r2, 18
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
