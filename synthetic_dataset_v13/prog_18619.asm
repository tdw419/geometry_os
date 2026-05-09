; DESCRIPTION: Renders a orange box of size 95x48 starting at (223, 183).
; PLAN: r0=223(x), r1=183(y), r2=95(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 183
LDI r2, 95
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
