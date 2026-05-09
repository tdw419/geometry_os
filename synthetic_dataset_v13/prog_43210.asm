; DESCRIPTION: Renders a white box of size 14x102 starting at (103, 135).
; PLAN: r0=103(x), r1=135(y), r2=14(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 135
LDI r2, 14
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
