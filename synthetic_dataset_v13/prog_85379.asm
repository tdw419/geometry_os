; DESCRIPTION: Renders a white box of size 26x25 starting at (412, 95).
; PLAN: r0=412(x), r1=95(y), r2=26(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 95
LDI r2, 26
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
