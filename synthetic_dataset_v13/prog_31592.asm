; DESCRIPTION: Renders a white box of size 15x90 starting at (478, 50).
; PLAN: r0=478(x), r1=50(y), r2=15(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 50
LDI r2, 15
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
