; DESCRIPTION: Renders a white box of size 58x53 starting at (9, 91).
; PLAN: r0=9(x), r1=91(y), r2=58(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 91
LDI r2, 58
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
