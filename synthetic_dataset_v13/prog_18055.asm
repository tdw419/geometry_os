; DESCRIPTION: Renders a orange box of size 90x16 starting at (241, 100).
; PLAN: r0=241(x), r1=100(y), r2=90(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 100
LDI r2, 90
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
