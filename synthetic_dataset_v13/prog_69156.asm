; DESCRIPTION: Renders a white box of size 16x34 starting at (345, 137).
; PLAN: r0=345(x), r1=137(y), r2=16(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 137
LDI r2, 16
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
