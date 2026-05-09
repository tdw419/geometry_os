; DESCRIPTION: Renders a orange box of size 64x108 starting at (79, 134).
; PLAN: r0=79(x), r1=134(y), r2=64(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 134
LDI r2, 64
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
