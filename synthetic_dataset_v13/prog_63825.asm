; DESCRIPTION: Renders a white box of size 90x50 starting at (50, 12).
; PLAN: r0=50(x), r1=12(y), r2=90(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 12
LDI r2, 90
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
