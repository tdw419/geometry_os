; DESCRIPTION: Renders a white box of size 22x65 starting at (22, 6).
; PLAN: r0=22(x), r1=6(y), r2=22(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 6
LDI r2, 22
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
