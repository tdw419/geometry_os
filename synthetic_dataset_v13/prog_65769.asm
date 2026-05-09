; DESCRIPTION: Renders a orange box of size 45x95 starting at (411, 71).
; PLAN: r0=411(x), r1=71(y), r2=45(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 71
LDI r2, 45
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
