; DESCRIPTION: Renders a white box of size 66x18 starting at (103, 68).
; PLAN: r0=103(x), r1=68(y), r2=66(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 68
LDI r2, 66
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
