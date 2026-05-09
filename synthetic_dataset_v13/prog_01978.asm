; DESCRIPTION: Renders a white box of size 48x41 starting at (60, 91).
; PLAN: r0=60(x), r1=91(y), r2=48(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 91
LDI r2, 48
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
