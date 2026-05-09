; DESCRIPTION: Renders a white box of size 87x65 starting at (199, 148).
; PLAN: r0=199(x), r1=148(y), r2=87(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 148
LDI r2, 87
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
