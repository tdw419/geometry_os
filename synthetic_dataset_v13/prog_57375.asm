; DESCRIPTION: Renders a white box of size 111x10 starting at (122, 93).
; PLAN: r0=122(x), r1=93(y), r2=111(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 93
LDI r2, 111
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
