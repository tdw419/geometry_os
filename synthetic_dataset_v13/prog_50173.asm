; DESCRIPTION: Renders a white box of size 54x94 starting at (103, 130).
; PLAN: r0=103(x), r1=130(y), r2=54(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 130
LDI r2, 54
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
