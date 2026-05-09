; DESCRIPTION: Renders a red box of size 13x65 starting at (411, 130).
; PLAN: r0=411(x), r1=130(y), r2=13(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 130
LDI r2, 13
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
