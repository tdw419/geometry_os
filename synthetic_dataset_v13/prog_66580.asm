; DESCRIPTION: Renders a white box of size 14x23 starting at (462, 160).
; PLAN: r0=462(x), r1=160(y), r2=14(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 160
LDI r2, 14
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
