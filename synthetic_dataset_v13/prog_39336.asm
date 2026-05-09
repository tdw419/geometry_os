; DESCRIPTION: Renders a white box of size 81x22 starting at (82, 209).
; PLAN: r0=82(x), r1=209(y), r2=81(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 209
LDI r2, 81
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
