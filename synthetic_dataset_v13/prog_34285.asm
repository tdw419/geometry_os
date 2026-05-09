; DESCRIPTION: Renders a white box of size 120x60 starting at (287, 17).
; PLAN: r0=287(x), r1=17(y), r2=120(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 17
LDI r2, 120
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
