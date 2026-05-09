; DESCRIPTION: Renders a orange box of size 48x49 starting at (443, 178).
; PLAN: r0=443(x), r1=178(y), r2=48(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 178
LDI r2, 48
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
