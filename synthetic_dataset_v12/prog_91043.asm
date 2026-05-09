; DESCRIPTION: Renders a red box of size 45x53 starting at (399, 91).
; PLAN: r0=399(x), r1=91(y), r2=45(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 91
LDI r2, 45
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
