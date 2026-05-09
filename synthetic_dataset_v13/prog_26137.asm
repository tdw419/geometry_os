; DESCRIPTION: Renders a white box of size 93x50 starting at (19, 188).
; PLAN: r0=19(x), r1=188(y), r2=93(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 188
LDI r2, 93
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
