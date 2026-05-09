; DESCRIPTION: Renders a white box of size 85x39 starting at (290, 173).
; PLAN: r0=290(x), r1=173(y), r2=85(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 173
LDI r2, 85
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
