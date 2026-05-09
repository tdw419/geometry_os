; DESCRIPTION: Renders a white box of size 68x13 starting at (279, 162).
; PLAN: r0=279(x), r1=162(y), r2=68(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 162
LDI r2, 68
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
