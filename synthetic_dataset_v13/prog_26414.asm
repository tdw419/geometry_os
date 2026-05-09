; DESCRIPTION: Renders a white box of size 43x106 starting at (202, 24).
; PLAN: r0=202(x), r1=24(y), r2=43(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 24
LDI r2, 43
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
