; DESCRIPTION: Renders a white box of size 46x18 starting at (216, 193).
; PLAN: r0=216(x), r1=193(y), r2=46(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 193
LDI r2, 46
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
