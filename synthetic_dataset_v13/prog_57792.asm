; DESCRIPTION: Renders a white box of size 76x95 starting at (75, 13).
; PLAN: r0=75(x), r1=13(y), r2=76(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 13
LDI r2, 76
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
