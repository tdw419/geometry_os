; DESCRIPTION: Renders a white box of size 59x58 starting at (96, 95).
; PLAN: r0=96(x), r1=95(y), r2=59(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 95
LDI r2, 59
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
