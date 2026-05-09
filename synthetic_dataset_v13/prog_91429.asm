; DESCRIPTION: Renders a white box of size 34x18 starting at (87, 68).
; PLAN: r0=87(x), r1=68(y), r2=34(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 68
LDI r2, 34
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
