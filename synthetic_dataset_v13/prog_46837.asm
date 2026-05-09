; DESCRIPTION: Renders a white box of size 108x29 starting at (395, 120).
; PLAN: r0=395(x), r1=120(y), r2=108(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 120
LDI r2, 108
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
