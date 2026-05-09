; DESCRIPTION: Renders a white box of size 54x12 starting at (385, 212).
; PLAN: r0=385(x), r1=212(y), r2=54(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 212
LDI r2, 54
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
