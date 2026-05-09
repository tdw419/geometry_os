; DESCRIPTION: Renders a white box of size 30x41 starting at (459, 91).
; PLAN: r0=459(x), r1=91(y), r2=30(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 91
LDI r2, 30
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
