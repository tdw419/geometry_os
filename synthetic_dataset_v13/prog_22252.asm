; DESCRIPTION: Renders a white box of size 18x73 starting at (116, 48).
; PLAN: r0=116(x), r1=48(y), r2=18(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 48
LDI r2, 18
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
