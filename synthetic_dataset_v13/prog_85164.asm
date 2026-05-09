; DESCRIPTION: Renders a white box of size 76x65 starting at (290, 167).
; PLAN: r0=290(x), r1=167(y), r2=76(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 167
LDI r2, 76
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
