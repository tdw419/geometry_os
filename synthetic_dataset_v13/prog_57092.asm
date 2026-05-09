; DESCRIPTION: Renders a white box of size 119x68 starting at (46, 60).
; PLAN: r0=46(x), r1=60(y), r2=119(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 60
LDI r2, 119
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
