; DESCRIPTION: Renders a yellow box of size 29x113 starting at (66, 116).
; PLAN: r0=66(x), r1=116(y), r2=29(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 116
LDI r2, 29
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
