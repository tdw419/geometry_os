; DESCRIPTION: Renders a white box of size 13x24 starting at (170, 55).
; PLAN: r0=170(x), r1=55(y), r2=13(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 55
LDI r2, 13
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
