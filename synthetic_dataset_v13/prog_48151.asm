; DESCRIPTION: Renders a orange box of size 23x95 starting at (286, 107).
; PLAN: r0=286(x), r1=107(y), r2=23(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 107
LDI r2, 23
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
