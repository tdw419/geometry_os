; DESCRIPTION: Renders a white box of size 65x59 starting at (375, 109).
; PLAN: r0=375(x), r1=109(y), r2=65(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 109
LDI r2, 65
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
